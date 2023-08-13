import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/search/domain/entities/search_item.dart';
import 'package:movies_app_clean_architecture_course/search/domain/use_cases/get_search_result_use_case.dart';

abstract class BaseSearchRepository {
  Future<Either<Failure, List<SearchItem>>> getSearchResult(SearchParamters parameters);
}
