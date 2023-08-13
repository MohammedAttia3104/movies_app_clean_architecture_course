import 'package:movies_app_clean_architecture_course/core/error/exceptions.dart';
import 'package:movies_app_clean_architecture_course/core/network/api_constance.dart';
import 'package:movies_app_clean_architecture_course/core/network/error_message_model.dart';
import 'package:movies_app_clean_architecture_course/movies/data/models/movie_details_model.dart';
import 'package:movies_app_clean_architecture_course/movies/data/models/movie_model.dart';
import 'package:movies_app_clean_architecture_course/movies/data/models/movie_recommendation_model.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie.dart';
import 'package:dio/dio.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_details.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_recommendation_use_case.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<Movie>> getNowPlaying();

  Future<List<Movie>> getTopRatedMovies();

  Future<List<Movie>> getPopularMovies();

  Future<MovieDetails> getMovieDetails(MovieDetailsParamater paramater);

  Future<List<RecommendationMovies>> getRecommendation(
      RecommendationParameters paramater);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<Movie>> getNowPlaying() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(MovieDetailsParamater paramater) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(paramater.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationMovies>> getRecommendation(
      RecommendationParameters paramater) async {
    final response =
        await Dio().get(ApiConstance.movieRecommendationPath(paramater.recommendationId));
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => MovieRecommendaionModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
