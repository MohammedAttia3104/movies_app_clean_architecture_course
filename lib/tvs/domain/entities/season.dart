import 'package:equatable/equatable.dart';

class Season extends Equatable {
  final String name;
  final String airDate;
  final int episodeCount;
  final int id;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final double voteAverage;

  const Season({
    required this.name,
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        name,
        airDate,
        episodeCount,
        id,
        overview,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}
