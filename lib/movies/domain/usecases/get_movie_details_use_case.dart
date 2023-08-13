import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/core/usecase/base_usecase.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_details.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/repositories/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParamater> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParamater parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParamater extends Equatable {
  final int movieId;

  const MovieDetailsParamater({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
