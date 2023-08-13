import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_recommendation.dart';

class TvRecommendaionModel extends TvRecommendation {
  const TvRecommendaionModel({
    required super.id,
    super.backdropPath,
  });

  factory TvRecommendaionModel.fromJson(Map<String, dynamic> json) =>
      TvRecommendaionModel(
        id: json["id"],
        backdropPath:
            json["backdrop_path"] ?? '/7gbmM2NWcqZONbp65HUWDf4wr0Q.jpg',
      );
}
