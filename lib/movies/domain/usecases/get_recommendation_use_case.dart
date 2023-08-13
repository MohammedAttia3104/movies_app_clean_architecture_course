import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/core/usecase/base_usecase.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/repositories/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<RecommendationMovies>, RecommendationParameters> {
  BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationMovies>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int recommendationId;

  const RecommendationParameters(this.recommendationId);

  @override
  List<Object> get props => [recommendationId];
}
