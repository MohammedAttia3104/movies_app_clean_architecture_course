import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture_course/core/error/exceptions.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/tvs/data/data_sources/tvs_remote_data_source.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_details.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/repositories/base_tv_repository.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_recommendation_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_details_use_case.dart';

class TvsRepository extends BaseTvRepository {
  BaseTvsRemoteDataSource baseTvsRemoteDataSource;

  TvsRepository(this.baseTvsRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getOnAirTvs() async {
    final result = await baseTvsRemoteDataSource.getOnAirTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTvs() async {
    final result = await baseTvsRemoteDataSource.getPopularTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTvs() async {
    final result = await baseTvsRemoteDataSource.getTopRatedTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(
      TvDetailsParameters parameters) async {
    final result = await baseTvsRemoteDataSource.getTvDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendation>>> getRecommendationTvs(
      RecommendaionTvParamters parameters) async {
    final result = await baseTvsRemoteDataSource.getTvRecommendaion(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
