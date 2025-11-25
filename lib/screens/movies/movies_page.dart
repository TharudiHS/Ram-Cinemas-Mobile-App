import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/second_button.dart';
import 'package:ram_cinemas/data/model/movie_model.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage({super.key});

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
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: const CustomAppBar(title: "MOVIES"),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // NOW SHOWING + ARROW
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text("NOW SHOWING", style: TextStyles.size24Eurostileregular),
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

          // CINEMA DROPDOWN
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
                Icon(Icons.tune, color: AppColours.gold, size: 22),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // MOVIE CARDS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }

  Widget _buildMovieCard(BuildContext context, MovieModel movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // POSTER CARD
        SizedBox(
          width: 172,
          height: 258,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(movie.poster, fit: BoxFit.cover),
          ),
        ),

        const SizedBox(height: 10),

        // TITLE
        Text(
          movie.title,
          textAlign: TextAlign.center,
          style: TextStyles.size16Promptsemiboldwhite,
        ),

        const SizedBox(height: 3),

        // SUBTITLE
        Text(movie.subtitle, style: TextStyles.size10Promptlight),

        const SizedBox(height: 5),

        // FORMATS ROW
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
                      style: TextStyle(fontSize: 10, color: AppColours.white),
                    ),
                  ),
                ),
              )
              .toList(),
        ),

        const SizedBox(height: 8),

        // BUY TICKETS BUTTON
        SecondButton(title: "BUY TICKETS", onTap: () {}),
      ],
    );
  }
}
