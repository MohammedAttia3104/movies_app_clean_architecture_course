import 'package:equatable/equatable.dart';

class WatchListItem extends Equatable {
  int? id;
  final int tmdbId;
  final String title;
  final String backdropUrl;
  final String posterUrl;
  final String releaseDate;
  final String genres;
  final String? runtime;
  final String overview;
  final int? noOfSeasons;
  final double voteAverage;
  bool isAdded;

  WatchListItem({
    this.id,
    required this.tmdbId,
    required this.title,
    required this.backdropUrl,
    required this.posterUrl,
    required this.genres,
    this.runtime,
    required this.overview,
    this.noOfSeasons,
    required this.voteAverage,
    required this.isAdded,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        tmdbId,
        title,
        backdropUrl,
        posterUrl,
        genres,
        runtime,
        overview,
        noOfSeasons,
        voteAverage,
        isAdded,
        releaseDate,
      ];
}
