import 'package:equatable/equatable.dart';

class SearchItem extends Equatable {
  final int id;
  final String posterPath;
  final String title;
  final bool isMovie;

  const SearchItem({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.isMovie,
  });

  @override
  List<Object> get props => [
        id,
        posterPath,
        title,
        isMovie,
      ];
}
