import 'package:movies_app_clean_architecture_course/tvs/data/models/season_model.dart';
import 'package:movies_app_clean_architecture_course/tvs/data/models/tv_genres_model.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required super.backdropPath,
    required super.episodeRunTime,
    required super.firstAirDate,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.name,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.overview,
    required super.seasons,
    required super.voteAverage,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsModel(
      backdropPath: json["backdrop_path"] ?? '/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg',
      voteAverage: json["vote_average"].toDouble(),
      name: json["name"],
      id: json["id"],
      episodeRunTime: List<int>.from(json["episode_run_time"] as List),
      firstAirDate: json["first_air_date"],
      genres: (json["genres"] as List)
          .map((e) => TvGenresModel.fromJson(e))
          .toList(),
      homepage: json["homepage"],
      numberOfEpisodes: json["number_of_episodes"],
      numberOfSeasons: json["number_of_seasons"],
      overview: json["overview"],
      seasons: (json["seasons"] as List)
          .map((e) => SeasonModel.fromJson(e))
          .toList(),
    );
  }
//
}
