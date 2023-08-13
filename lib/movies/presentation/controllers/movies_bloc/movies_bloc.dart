import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture_course/core/usecase/base_usecase.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/entities/movie.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_top_rated_movies_use_case.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(MoviesInitial()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      MoviesEvent event, Emitter<MoviesState> emit) async {
    emit(NowPlayingMoviesLoadingState());
    final result = await getNowPlayMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(NowPlayingMoviesErrorState(l.message)),
      (r) => emit(NowPlayingMoviesLoadedState(nowPlayingMovies: r)),
    );
  }

  FutureOr<void> _getPopularMovies(
      MoviesEvent event, Emitter<MoviesState> emit) async {
    emit(PopularMoviesLoadingState());
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(PopularMoviesErrorState(l.message)),
      (r) => emit(PopularMoviesLoadedState(popularMovies: r)),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      MoviesEvent event, Emitter<MoviesState> emit) async {
    emit(TopRatedMoviesLoadingState());
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(TopRatedMoviesErrorState(l.message)),
      (r) => emit(TopRatedMoviesLoadedState(topRatedMovies: r)),
    );
  }
}
