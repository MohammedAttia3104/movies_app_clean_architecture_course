import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_details.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_recommendation_use_case.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParamater paramters);

  Future<Either<Failure, List<RecommendationMovies>>> getRecommendation(
      RecommendationParameters paramters);
}
