part of 'tv_details_bloc.dart';

abstract class TvDetailsState extends Equatable {
  const TvDetailsState();
}

class TvDetailsInitial extends TvDetailsState {
  @override
  List<Object> get props => [];
}

class TvDetailsLoadingState extends TvDetailsState {
  @override
  List<Object> get props => [];
}

class TvDetailsLoadedState extends TvDetailsState {
  TvDetails tvDetails;

  TvDetailsLoadedState({required this.tvDetails});

  @override
  List<Object> get props => [tvDetails];
}

class TvDetailsErrorState extends TvDetailsState {
  final String message;

  const TvDetailsErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class TvRecommendaionLoadingState extends TvDetailsState {
  @override
  List<Object> get props => [];
}

class TvRecommendaionLoadedState extends TvDetailsState {
  List<TvRecommendation> tvRecommendaionList = [];

  TvRecommendaionLoadedState({required this.tvRecommendaionList});

  @override
  List<Object> get props => [tvRecommendaionList];
}

class TvRecommendaionErrorState extends TvDetailsState {
  final String message;

  const TvRecommendaionErrorState(this.message);

  @override
  List<Object> get props => [message];
}
