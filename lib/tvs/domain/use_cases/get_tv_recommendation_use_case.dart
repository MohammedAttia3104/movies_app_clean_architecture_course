import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/core/usecase/base_usecase.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/repositories/base_tv_repository.dart';

class GetTvRecommendationUseCase
    extends BaseUseCase<List<TvRecommendation>, RecommendaionTvParamters> {
  BaseTvRepository baseTvRepository;

  GetTvRecommendationUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<TvRecommendation>>> call(
      RecommendaionTvParamters parameters) async {
    return await baseTvRepository.getRecommendationTvs(parameters);
  }
}

class RecommendaionTvParamters extends Equatable {
  final int recommendationTvId;

  const RecommendaionTvParamters({required this.recommendationTvId});

  @override
  List<Object> get props => [recommendationTvId];
}
