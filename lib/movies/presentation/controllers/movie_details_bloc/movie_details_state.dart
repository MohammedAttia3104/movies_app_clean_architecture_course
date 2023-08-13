part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailsLoadingState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailsLoadedState extends MovieDetailsState {
  MovieDetails movieDetails;

  MovieDetailsLoadedState(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String message;

  const MovieDetailsErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class RecommendationLoadingState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class RecommendationLoadedState extends MovieDetailsState {
  List<RecommendationMovies> recommendation = [];

  RecommendationLoadedState(this.recommendation);

  @override
  List<Object> get props => [recommendation];
}

class RecommendationErrorState extends MovieDetailsState {
  final String message;

  const RecommendationErrorState(this.message);

  @override
  List<Object> get props => [message];
}
