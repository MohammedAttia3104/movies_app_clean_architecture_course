import 'package:movies_app_clean_architecture_course/search/domain/entities/search_item.dart';

class SearchItemModel extends SearchItem {
  const SearchItemModel({
    required super.id,
    required super.posterPath,
    required super.title,
    required super.isMovie,
  });

  factory SearchItemModel.fromJson(Map<String, dynamic> json) {
    return SearchItemModel(
      posterPath: json["poster_path"] ?? "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg",
      id: json["id"],
      isMovie: json['media_type'] == 'movie',
      title: json["title"] ?? json["name"],
    );
  }
}
