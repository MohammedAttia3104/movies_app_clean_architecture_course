import 'package:movies_app_clean_architecture_course/tvs/domain/entities/Season.dart';

class SeasonModel extends Season {
  const SeasonModel(
      {required super.name,
      required super.airDate,
      required super.episodeCount,
      required super.id,
      required super.overview,
      required super.posterPath,
      required super.seasonNumber,
      required super.voteAverage});

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      overview: json["overview"],
      name: json["name"],
      id: json["id"],
      voteAverage: json["vote_average"].toDouble(),
      airDate: json["air_date"] ?? '',
      episodeCount: json["episode_count"],
      posterPath: json["poster_path"],
      seasonNumber: json["season_number"],
    );
  }
}
