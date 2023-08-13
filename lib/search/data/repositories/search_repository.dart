import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture_course/core/error/exceptions.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/search/data/data_sources/remote_search_data_source.dart';
import 'package:movies_app_clean_architecture_course/search/domain/entities/search_item.dart';
import 'package:movies_app_clean_architecture_course/search/domain/repositories/base_search_repository.dart';
import 'package:movies_app_clean_architecture_course/search/domain/use_cases/get_search_result_use_case.dart';

class SearchRepository extends BaseSearchRepository {
  BaseRemoteSearchDataSource baseRemoteSearchDataSource;

  SearchRepository(this.baseRemoteSearchDataSource);

  @override
  Future<Either<Failure, List<SearchItem>>> getSearchResult(
      SearchParamters parameters) async {
    final result = await baseRemoteSearchDataSource.getSearchResult(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
