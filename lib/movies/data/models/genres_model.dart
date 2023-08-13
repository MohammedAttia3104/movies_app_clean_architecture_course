import 'package:movies_app_clean_architecture_course/movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      name: json["name"],
      id: json["id"],
    );
  }

}
