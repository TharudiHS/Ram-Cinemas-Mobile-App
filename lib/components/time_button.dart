import 'package:flutter/material.dart';
import 'package:ram_cinemas/utils/app_colours.dart';
import 'package:ram_cinemas/data/model/showtime_model.dart';

class TimeButtonList extends StatelessWidget {
  final List<ShowTimeModel> showtimes;
  final int selectedIndex;
  final Function(int) onSelected;

  const TimeButtonList({
    super.key,
    required this.showtimes,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(showtimes.length, (index) {
        final item = showtimes[index];
        final bool isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: item.isDisabled ? null : () => onSelected(index),
          child: Opacity(
            opacity: item.isDisabled ? 0.35 : 1.0,
            child: Container(
              width: 110,
              height: 39,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: isSelected ? AppColours.gold : AppColours.white,
                  width: 2,
                ),
              ),
              child: Text(
                item.time,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? AppColours.gold : AppColours.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
