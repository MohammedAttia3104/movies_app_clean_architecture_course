part of 'tv_bloc.dart';

abstract class TvState extends Equatable {
  const TvState();
}

class TvInitial extends TvState {
  @override
  List<Object> get props => [];
}

class OnAirTvLoadingState extends TvState {
  @override
  List<Object> get props => [];
}

class OnAirTvLoadedState extends TvState {
  List<Tv> onAirTvs = [];

  OnAirTvLoadedState({required this.onAirTvs});

  @override
  List<Object> get props => [];
}

class OnAirTvErrorState extends TvState {
  final String message;

  const OnAirTvErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class PopularTvLoadingState extends TvState {
  @override
  List<Object> get props => [];
}

class PopularTvLoadedState extends TvState {
  List<Tv> popularTvs = [];

  PopularTvLoadedState({required this.popularTvs});

  @override
  List<Object> get props => [];
}

class PopularTvErrorState extends TvState {
  final String message;

  const PopularTvErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedTvLoadingState extends TvState {
  @override
  List<Object> get props => [];
}

class TopRatedTvLoadedState extends TvState {
  List<Tv> topRatedTvs = [];

  TopRatedTvLoadedState({required this.topRatedTvs});

  @override
  List<Object> get props => [];
}

class TopRatedTvErrorState extends TvState {
  final String message;

  const TopRatedTvErrorState(this.message);

  @override
  List<Object> get props => [message];
}
