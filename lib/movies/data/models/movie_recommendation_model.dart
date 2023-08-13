import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_recommendation.dart';

class MovieRecommendaionModel extends RecommendationMovies {
  const MovieRecommendaionModel({
    required super.id,
    required super.backdropPath,
  });

  factory MovieRecommendaionModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendaionModel(
        id: json["id"],
        backdropPath:
            json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
      );
}
