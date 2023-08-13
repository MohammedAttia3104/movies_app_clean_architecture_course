import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture_course/core/usecase/base_usecase.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_on_air_tvs_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_popular_tvs_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_top_rated_tvs_use_case.dart';

part 'tv_event.dart';

part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  GetOnAirTvsUseCase getOnAirTvUseCase;
  GetPopularTvsUseCase getPopularTvsUseCase;
  GetTopRatedTvsUseCase getTopRatedTvsUseCase;

  TvBloc(
    this.getTopRatedTvsUseCase,
    this.getPopularTvsUseCase,
    this.getOnAirTvUseCase,
  ) : super(TvInitial()) {
    on<GetOnAirTvsEvent>(_getOnAirTv);
    on<GetPopularTvsEvent>(_getPopularTv);
    on<GetTopRatedTvsEvent>(_getTopRatedTv);
  }

  FutureOr<void> _getOnAirTv(TvEvent event, Emitter<TvState> emit) async {
    emit(OnAirTvLoadingState());
    final result = await getOnAirTvUseCase(const NoParameters());
    result.fold(
      (l) => emit(OnAirTvErrorState(l.message)),
      (r) => emit(OnAirTvLoadedState(onAirTvs: r)),
    );
  }

  FutureOr<void> _getPopularTv(
      GetPopularTvsEvent event, Emitter<TvState> emit) async {
    emit(PopularTvLoadingState());
    final result = await getPopularTvsUseCase(const NoParameters());
    result.fold(
      (l) => emit(PopularTvErrorState(l.message)),
      (r) => emit(PopularTvLoadedState(popularTvs: r)),
    );
  }

  FutureOr<void> _getTopRatedTv(
      GetTopRatedTvsEvent event, Emitter<TvState> emit) async {
    emit(TopRatedTvLoadingState());
    final result = await getTopRatedTvsUseCase(const NoParameters());
    result.fold(
      (l) => emit(TopRatedTvErrorState(l.message)),
      (r) => emit(TopRatedTvLoadedState(topRatedTvs: r)),
    );
  }
}
