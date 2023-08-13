import 'package:equatable/equatable.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final List<Genres> genres;
  final String backdropPath;
  final String overview;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final int id;
  final int runtime;

  const MovieDetails({
    required this.genres,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.id,
    required this.releaseDate,
    required this.runtime,
  });

  @override
  List<Object> get props => [
        genres,
        backdropPath,
        overview,
        title,
        releaseDate,
        voteAverage,
        id,
        runtime,
      ];
}
