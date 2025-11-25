import 'showtime_model.dart';

class CinemaShowtimes {
  final String cinemaName;
  final String screenName;
  final List<ShowTimeModel> showtimes;

  CinemaShowtimes({
    required this.cinemaName,
    required this.screenName,
    required this.showtimes,
  });
}
