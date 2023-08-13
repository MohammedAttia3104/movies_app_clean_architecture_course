import 'package:movies_app_clean_architecture_course/movies/data/models/genres_model.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.genres,
    required super.backdropPath,
    required super.title,
    required super.voteAverage,
    required super.overview,
    required super.id,
    required super.releaseDate,
    required super.runtime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      genres: (json["genres"] as List)
          .map((json) => GenresModel.fromJson(json))
          .toList(),
      backdropPath: json["backdrop_path"] ?? "/jWXrQstj7p3Wl5MfYWY6IHqRpDb.jpg",
      title: json["title"],
      voteAverage: json["vote_average"],
      overview: json["overview"],
      id: json["id"],
      releaseDate: json["release_date"],
      runtime: json["runtime"],
    );
  }
}
