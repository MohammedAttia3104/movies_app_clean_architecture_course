part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class NowPlayingMoviesLoadingState extends MoviesState {}

class NowPlayingMoviesLoadedState extends MoviesState {
   List<Movie> nowPlayingMovies = [];

  NowPlayingMoviesLoadedState({required this.nowPlayingMovies});
}

class NowPlayingMoviesErrorState extends MoviesState {
  final String message;

  NowPlayingMoviesErrorState(this.message);
}

class PopularMoviesLoadingState extends MoviesState {}

class PopularMoviesLoadedState extends MoviesState {
   List<Movie> popularMovies = [];

  PopularMoviesLoadedState({required this.popularMovies});
}

class PopularMoviesErrorState extends MoviesState {
  final String message;

  PopularMoviesErrorState(this.message);
}

class TopRatedMoviesLoadingState extends MoviesState {}

class TopRatedMoviesLoadedState extends MoviesState {
   List<Movie> topRatedMovies = [];

  TopRatedMoviesLoadedState({required this.topRatedMovies});
}

class TopRatedMoviesErrorState extends MoviesState {
  final String message;

  TopRatedMoviesErrorState(this.message);
}
