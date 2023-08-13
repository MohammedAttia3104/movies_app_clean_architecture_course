part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchResultLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchResultLoadedState extends SearchState {
  List<SearchItem> searchList = [];

  SearchResultLoadedState({required this.searchList});

  @override
  List<Object> get props => [searchList];
}

class EmptySearchResultState extends SearchState {
  List<SearchItem> searchList = [];

  EmptySearchResultState({required this.searchList});

  @override
  List<Object> get props => [searchList];
}

class SearchResultErrorState extends SearchState {
  final String message;

  const SearchResultErrorState(this.message);

  @override
  List<Object> get props => [message];
}
