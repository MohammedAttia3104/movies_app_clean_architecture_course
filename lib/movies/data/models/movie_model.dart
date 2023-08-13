import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      overview: json["overview"],
      genreIds: List<int>.from(json["genre_ids"]),
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"],
    );
  }
}
