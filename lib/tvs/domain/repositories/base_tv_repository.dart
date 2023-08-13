import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_details.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_recommendation_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_details_use_case.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getOnAirTvs();

  Future<Either<Failure, List<Tv>>> getPopularTvs();

  Future<Either<Failure, List<Tv>>> getTopRatedTvs();

  Future<Either<Failure, TvDetails>> getTvDetails(
      TvDetailsParameters parameters);

  Future<Either<Failure, List<TvRecommendation>>> getRecommendationTvs(
      RecommendaionTvParamters parameters);
}
