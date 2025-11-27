// lib/pages/nowshowing_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ram_cinemas/components/second_button.dart';
import 'package:ram_cinemas/data/model/movie_model.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class NowShowingPage extends StatelessWidget {
  NowShowingPage({super.key});

  final ScrollController _scrollController = ScrollController();

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  TITLE + ARROWS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("NOW SHOWING", style: TextStyles.size20Eurostileregular),
              Row(
                children: [
                  _arrowButton("assets/images/left.svg", () {
                    _scrollController.animateTo(
                      _scrollController.offset - 200,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }),
                  const SizedBox(width: 10),
                  _arrowButton("assets/images/right.svg", () {
                    _scrollController.animateTo(
                      _scrollController.offset + 200,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // MOVIE LIST
        SizedBox(
          height: 410,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemCount: movies.length,
            separatorBuilder: (_, __) => const SizedBox(width: 18),
            itemBuilder: (context, index) {
              return _buildMovieCard(context, movies[index]);
            },
          ),
        ),
      ],
    );
  }

  // ARROW BUTTON
  Widget _arrowButton(String svgPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(svgPath, width: 31.93, height: 31.93),
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

        SecondButton(title: "BUY TICKETS", onTap: () {}),
      ],
    );
  }
}
