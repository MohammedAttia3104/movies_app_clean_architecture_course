part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();
}

class GetOnAirTvsEvent extends TvEvent {
  @override
  List<Object> get props => [];
}

class GetPopularTvsEvent extends TvEvent {
  @override
  List<Object> get props => [];
}

class GetTopRatedTvsEvent extends TvEvent {
  @override
  List<Object> get props => [];
}
