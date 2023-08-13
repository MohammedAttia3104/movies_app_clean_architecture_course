import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture_course/search/domain/entities/search_item.dart';
import 'package:movies_app_clean_architecture_course/search/domain/use_cases/get_search_result_use_case.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GetSearchResultUseCase getSearchResultUseCase;

  SearchBloc(this.getSearchResultUseCase) : super(SearchInitial()) {
    on<GetSearchResultEvent>(_getSearchResult);
  }

  FutureOr<void> _getSearchResult(
      GetSearchResultEvent event, Emitter<SearchState> emit) async {
    if (event.title.trim().isEmpty) {
      emit(EmptySearchResultState(searchList: const []));
    }
    emit(SearchResultLoadingState());
    final result = await getSearchResultUseCase(SearchParamters(event.title));
    print(result);
    result.fold((l) => emit(SearchResultErrorState(l.message)), (r) {
      if (r.isEmpty) {
        emit(EmptySearchResultState(searchList: const []));
      } else {
        emit(SearchResultLoadedState(searchList: r));
      }
    });
  }
}
