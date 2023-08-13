import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_details.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_details_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_recommendation_use_case.dart';

part 'tv_details_event.dart';

part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  GetTvRecommendationUseCase getTvRecommendationUseCase;
  GetTvDetailsUseCase getTvDetailsUseCase;

  TvDetailsBloc(
    this.getTvRecommendationUseCase,
    this.getTvDetailsUseCase,
  ) : super(TvDetailsInitial()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetTvRecommendationEvent>(_getTvRecommendaion);
  }

  FutureOr<void> _getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    emit(TvDetailsLoadingState());
    final result =
        await getTvDetailsUseCase(TvDetailsParameters(tvId: event.id));
    result.fold(
      (l) => emit(TvDetailsErrorState(l.message)),
      (r) => emit(TvDetailsLoadedState(tvDetails: r)),
    );
  }

  FutureOr<void> _getTvRecommendaion(
      GetTvRecommendationEvent event, Emitter<TvDetailsState> emit) async {
    emit(TvRecommendaionLoadingState());
    final result = await getTvRecommendationUseCase(
        RecommendaionTvParamters(recommendationTvId: event.id));
    result.fold(
      (l) => emit(TvRecommendaionErrorState(l.message)),
      (r) => emit(TvRecommendaionLoadedState(tvRecommendaionList: r)),
    );
  }
}
