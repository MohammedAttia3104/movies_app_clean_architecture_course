import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String? backdropPath;
  final List<int?> genreIds;
  final String name;
  final int id;
  final String overView;
  final String firstAirDate;
  final double voteAverage;

  const Tv({
    this.backdropPath,
    required this.genreIds,
    required this.name,
    required this.id,
    required this.overView,
    required this.voteAverage,
    required this.firstAirDate,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        name,
        id,
        overView,
        voteAverage,
      ];
}
