import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final int number;
  final int season;
  final String name;
  final String runtime;
  final String stillPath;
  final String airDate;

  const Episode({
    required this.number,
    required this.season,
    required this.name,
    required this.runtime,
    required this.stillPath,
    required this.airDate,
  });

  @override
  List<Object?> get props => [
    number,
    season,
    name,
    runtime,
    stillPath,
    airDate,
  ];
}


// {
// "id": 4533080,
// "name": "Episode 223",
// "overview": "",
// "vote_average": 0.0,
// "vote_count": 0,
// "air_date": "2023-08-11",
// "episode_number": 223,
// "episode_type": "standard",
// "production_code": "",
// "runtime": 15,
// "season_number": 72,
// "show_id": 94722,
// "still_path": null
// }