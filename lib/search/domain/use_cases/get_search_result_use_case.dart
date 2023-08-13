import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/core/usecase/base_usecase.dart';
import 'package:movies_app_clean_architecture_course/search/domain/entities/search_item.dart';
import 'package:movies_app_clean_architecture_course/search/domain/repositories/base_search_repository.dart';

class GetSearchResultUseCase
    extends BaseUseCase<List<SearchItem>, SearchParamters> {
  BaseSearchRepository baseSearchRepository;

  GetSearchResultUseCase(this.baseSearchRepository);

  @override
  Future<Either<Failure, List<SearchItem>>> call(
      SearchParamters parameters) async {
    return await baseSearchRepository.getSearchResult(parameters);
  }
}

class SearchParamters extends Equatable {
  final String title;

  const SearchParamters(this.title);

  @override
  List<Object> get props => [title];
}
