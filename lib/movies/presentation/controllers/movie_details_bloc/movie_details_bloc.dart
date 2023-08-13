import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_details.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie_recommendation.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_recommendation_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoadingState());
    final result =
        await getMovieDetailsUseCase(MovieDetailsParamater(movieId: event.id));
    log(result.toString());
    result.fold(
      (l) => emit(MovieDetailsErrorState(l.message)),
      (r) => emit(MovieDetailsLoadedState(r)),
    );
  }

  FutureOr<void> _getRecommendation(
      GetRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    emit(RecommendationLoadingState());
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    log(result.toString());
    result.fold(
      (l) => emit(RecommendationErrorState(l.message)),
      (r) => emit(RecommendationLoadedState(r)),
    );
  }
}
