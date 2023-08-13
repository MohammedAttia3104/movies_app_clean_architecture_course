import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({
    super.backdropPath,
    required super.genreIds,
    required super.name,
    required super.id,
    required super.overView,
    required super.voteAverage,
    required super.firstAirDate,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json["id"],
      name: json["name"],
      backdropPath: json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
      genreIds: List<int?>.from(json["genre_ids"]),
      overView: json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      firstAirDate: json["first_air_date"],
    );
  }
}
