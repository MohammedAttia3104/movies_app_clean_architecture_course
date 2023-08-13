import 'package:dio/dio.dart';
import 'package:movies_app_clean_architecture_course/core/error/exceptions.dart';
import 'package:movies_app_clean_architecture_course/core/network/api_constance.dart';
import 'package:movies_app_clean_architecture_course/core/network/error_message_model.dart';
import 'package:movies_app_clean_architecture_course/tvs/data/models/tv_details_model.dart';
import 'package:movies_app_clean_architecture_course/tvs/data/models/tv_recommendation_model.dart';
import 'package:movies_app_clean_architecture_course/tvs/data/models/tv_model.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_details.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_recommendation_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_details_use_case.dart';

abstract class BaseTvsRemoteDataSource {
  Future<List<Tv>> getOnAirTv();

  Future<List<Tv>> getPopularTv();

  Future<List<Tv>> getTopRatedTv();

  Future<TvDetails> getTvDetails(TvDetailsParameters parameters);

  Future<List<TvRecommendation>> getTvRecommendaion(
      RecommendaionTvParamters parameters);
}

class TvsRemoteDataSource extends BaseTvsRemoteDataSource {
  @override
  Future<List<Tv>> getOnAirTv() async {
    final response = await Dio().get(ApiConstance.onAirTvsPath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => TvModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Tv>> getPopularTv() async {
    final response = await Dio().get(ApiConstance.popularTvsPath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => TvModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Tv>> getTopRatedTv() async {
    final response = await Dio().get(ApiConstance.topRatedTvsPath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => TvModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetails> getTvDetails(TvDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.tvDetailsPath(parameters.tvId));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvRecommendation>> getTvRecommendaion(
      RecommendaionTvParamters parameters) async {
    final response = await Dio()
        .get(ApiConstance.tvRecommendationPath(parameters.recommendationTvId));
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => TvRecommendaionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
