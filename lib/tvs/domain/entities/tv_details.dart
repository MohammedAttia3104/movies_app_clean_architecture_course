import 'package:equatable/equatable.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/Season.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_genres.dart';

class TvDetails extends Equatable {
  final String backdropPath;
  final List<int?> episodeRunTime;
  final String firstAirDate;
  final List<TvGenres> genres;
  final String homepage;
  final int id;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String overview;
  final List<Season> seasons;
  final double voteAverage;

  const TvDetails({
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.overview,
    required this.seasons,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        overview,
        seasons,
        voteAverage,
      ];
}
