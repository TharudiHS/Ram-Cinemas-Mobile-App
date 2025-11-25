import 'package:flutter/material.dart';
import 'package:ram_cinemas/components/app_bar.dart';
import 'package:ram_cinemas/components/bottom_nav_bar.dart';
import 'package:ram_cinemas/components/main_button.dart';
import 'package:ram_cinemas/components/time_button.dart';
import 'package:ram_cinemas/data/model/cinema_showtimes_model.dart';
import 'package:ram_cinemas/data/model/date_model.dart';
import 'package:ram_cinemas/data/model/showtime_model.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/utils/text_styles.dart';

class ShowTimesPage extends StatefulWidget {
  const ShowTimesPage({super.key});

  @override
  _ShowTimesPageState createState() => _ShowTimesPageState();
}

class _ShowTimesPageState extends State<ShowTimesPage> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = 1;

  final List<DateModel> dates = [
    DateModel(month: "January", day: "19", weekDay: "FRI"),
    DateModel(month: "January", day: "20", weekDay: "SAT"),
    DateModel(month: "January", day: "21", weekDay: "SUN"),
    DateModel(month: "January", day: "22", weekDay: "MON"),
    DateModel(month: "January", day: "23", weekDay: "TUE"),
    DateModel(month: "January", day: "24", weekDay: "WED"),
    DateModel(month: "January", day: "25", weekDay: "THU"),
  ];

  late final CinemaShowtimes cinemaData;

  @override
  void initState() {
    super.initState();

    cinemaData = CinemaShowtimes(
      cinemaName: "RAM CINEMAS - WATTALA",
      screenName: "SCREEN 1",
      showtimes: [
        ShowTimeModel(time: "10:00 AM", isDisabled: true),
        ShowTimeModel(time: "03:00 PM"),
        ShowTimeModel(time: "06:30 PM"),
        ShowTimeModel(time: "07:00 PM"),
        ShowTimeModel(time: "10:20 PM"),
        ShowTimeModel(time: "11:00 PM"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: CustomAppBar(title: "SHOWTIMES"),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            color: AppColours.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // POSTER + DETAILS
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/joker.png",
                        width: 96,
                        height: 143,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "JOKER: FOLIE À DEUX",
                            style: TextStyles.size20Promptwhite,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "2024 | MUSICAL, THRILLER |",
                            style: TextStyles.size12PromptmediumgreyLight,
                          ),
                          SizedBox(height: 4),
                          Text(
                            "2D, 3D | 2HR 18MIN",
                            style: TextStyles.size12PromptmediumgreyLight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                //DATE SCROLLER
                SizedBox(
                  height: 110,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      final item = dates[index];
                      bool isSelected = selectedDateIndex == index;

                      return GestureDetector(
                        onTap: () => setState(() => selectedDateIndex = index),
                        child: Container(
                          width: 76,
                          height: 106,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFD9A935)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.transparent
                                  : const Color(0xFF4D4D4D),
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item.month, style: TextStyles.size7Poppins),
                              const SizedBox(height: 4),
                              Text(
                                item.day,
                                style: TextStyles.size40Poppins.copyWith(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),

                              const SizedBox(height: 3),
                              Text(
                                item.weekDay,
                                style: TextStyles.size14Poppins.copyWith(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                customDivider(),
                const SizedBox(height: 10),
              ],
            ),
          ),

          //SCROLLABLE SECTION
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${cinemaData.cinemaName} | ${cinemaData.screenName}",
                      style: TextStyles.size16Promptmediumwhite,
                    ),

                    const SizedBox(height: 35),

                    // TIME BUTTONS
                    TimeButtonList(
                      showtimes: cinemaData.showtimes,
                      selectedIndex: selectedTimeIndex,
                      onSelected: (index) {
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                    ),

                    const SizedBox(height: 35),

                    Divider(color: Colors.white24, thickness: 0.5),
                    const SizedBox(height: 12),

                    Text(
                      "${cinemaData.cinemaName} | ${cinemaData.screenName}",
                      style: TextStyles.size16Promptmediumwhite,
                    ),

                    const SizedBox(height: 35),
                    TimeButtonList(
                      showtimes: cinemaData.showtimes,
                      selectedIndex: selectedTimeIndex,
                      onSelected: (index) {
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      //  BOTTOM BUTTON + NAV
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: MainButton(title: "BUY TICKETS", onTap: () {}),
          ),
          const BottomNavBar(selectedIndex: 1),
        ],
      ),
    );
  }

  Widget customDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: AppColours.lineColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),

        Container(
          width: 76,
          height: 5,
          decoration: BoxDecoration(
            color: AppColours.lineColor,
            borderRadius: BorderRadius.circular(3),
          ),
        ),

        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: AppColours.lineColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ],
    );
  }
}
