import 'package:dio/dio.dart';
import 'package:movies_app_clean_architecture_course/core/error/exceptions.dart';
import 'package:movies_app_clean_architecture_course/core/network/api_constance.dart';
import 'package:movies_app_clean_architecture_course/core/network/error_message_model.dart';
import 'package:movies_app_clean_architecture_course/search/data/models/search_item_model.dart';
import 'package:movies_app_clean_architecture_course/search/domain/entities/search_item.dart';
import 'package:movies_app_clean_architecture_course/search/domain/use_cases/get_search_result_use_case.dart';

abstract class BaseRemoteSearchDataSource {
  Future<List<SearchItem>> getSearchResult(SearchParamters searchParamters);
}

class RemoteSearchDataSource extends BaseRemoteSearchDataSource {
  @override
  Future<List<SearchItem>> getSearchResult(
      SearchParamters searchParamters) async {
    final response =
        await Dio().get(ApiConstance.multiSearchPath(searchParamters.title));
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .where((element) => element["media_type"] != "person")
          .map((e) => SearchItemModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
