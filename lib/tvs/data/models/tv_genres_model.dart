import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_genres.dart';

class TvGenresModel extends TvGenres {
  const TvGenresModel({
    required super.id,
    required super.name,
  });

  factory TvGenresModel.fromJson(Map<String, dynamic> json) {
    return TvGenresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
