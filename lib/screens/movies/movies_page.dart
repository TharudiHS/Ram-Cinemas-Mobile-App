import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/second_button.dart';
import 'package:ram_cinemas/data/model/movie_model.dart';
import 'package:ram_cinemas/screens/movies/movies_inner_page.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  bool showFilter = false;

  final List<String> genres = [
    "Action",
    "Drama",
    "Animation",
    "Horror",
    "Thriller",
    "Adventure",
    "Sci-fi",
    "Comedy",
    "Family",
  ];

  final List<String> languages = ["Tamil", "English", "Sinhala"];
  final List<String> experiences = ["2D", "3D", "Dolby Atmos"];

  String selectedGenre = "";
  String selectedLanguage = "";
  String selectedExperience = "";

  final List<MovieModel> movies = List.generate(
    6,
    (index) => MovieModel(
      title: "VENOM: THE LAST \nDANCE",
      subtitle: "Animation, Family | 1 HR 30 MIN",
      formats: ["2D", "3D", "Dolby Atmos"],
      poster: "assets/images/venom.png",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // MAIN PAGE
        Scaffold(
          backgroundColor: AppColours.black,
          appBar: const CustomAppBar(title: "MOVIES"),

          // BODY
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      "NOW SHOWING",
                      style: TextStyles.size24Eurostileregular,
                    ),
                    const SizedBox(width: 6),
                    SvgPicture.asset(
                      "assets/images/arrow.svg",
                      width: 12.79,
                      height: 5.57,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/location.svg",
                      width: 18.48,
                      height: 21.98,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Ram Cinemas - Wattala",
                      style: TextStyles.size20Promptgold,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/images/arrow.svg",
                      width: 12.79,
                      height: 5.57,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showFilter = true;
                        });
                      },
                      child: Icon(Icons.tune, color: AppColours.gold, size: 22),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: GridView.builder(
                    padding: const EdgeInsets.only(bottom: 120),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 420,
                        ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return _buildMovieCard(context, movies[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        // BOTTOM NAV
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: BottomNavBar(selectedIndex: 1),
        ),

        // FILTER POPUP OVERLAY
        if (showFilter) ...[
          Positioned.fill(
            child: GestureDetector(
              onTap: () => setState(() => showFilter = false),
              child: Container(color: Colors.transparent),
            ),
          ),

          Positioned(left: 0, right: 0, bottom: 82, child: _buildFilterPopup()),
        ],
      ],
    );
  }

  // FILTER POPUP
  Widget _buildFilterPopup() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          width: 412,
          height: 510,
          decoration: BoxDecoration(
            color: AppColours.darkGrey.withOpacity(0.70),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP GOLD BAR
              Center(
                child: Container(
                  width: 148,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColours.gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // FILTER HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter by", style: TextStyles.size20Promptwhite),
                  Text("Clear All", style: TextStyles.size12Promptregular),
                ],
              ),

              const SizedBox(height: 15),
              _buildChips(genres, selectedGenre, (v) {
                setState(() => selectedGenre = v);
              }),

              const SizedBox(height: 25),

              Text("Language", style: TextStyles.size20Promptwhite),
              const SizedBox(height: 15),
              _buildChips(languages, selectedLanguage, (v) {
                setState(() => selectedLanguage = v);
              }),

              const SizedBox(height: 25),

              Text("Experience", style: TextStyles.size20Promptwhite),
              const SizedBox(height: 15),
              _buildChips(experiences, selectedExperience, (v) {
                setState(() => selectedExperience = v);
              }),
            ],
          ),
        ),
      ),
    );
  }

  // FILTER CHIP BUILDER
  Widget _buildChips(
    List<String> items,
    String selected,
    Function(String) onTap,
  ) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: items.map((item) {
        final bool isSelected = item == selected;
        return GestureDetector(
          onTap: () => onTap(item),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: isSelected ? AppColours.gold : AppColours.greyLight,
                width: 1,
              ),
            ),
            child: Text(
              item,
              style: TextStyle(
                color: isSelected ? AppColours.gold : AppColours.greyLight,
                fontSize: 14,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // MOVIE CARD
  Widget _buildMovieCard(BuildContext context, MovieModel movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 172,
          height: 258,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(movie.poster, fit: BoxFit.cover),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          movie.title,
          textAlign: TextAlign.center,
          style: TextStyles.size16Promptsemiboldwhite,
        ),

        const SizedBox(height: 3),

        Text(movie.subtitle, style: TextStyles.size10Promptlight),

        const SizedBox(height: 5),

        Row(
          children: movie.formats
              .map(
                (f) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColours.white, width: 1),
                    ),
                    child: Text(
                      f,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              )
              .toList(),
        ),

        const SizedBox(height: 8),

        SecondButton(
          title: "BUY TICKETS",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieInnerPage()),
            );
          },
        ),
      ],
    );
  }
}
