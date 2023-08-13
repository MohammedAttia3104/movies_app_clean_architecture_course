// import 'package:equatable/equatable.dart';
// import 'package:movies_app_clean_architecture_course/watch_list/domain/entities/watch_list_item.dart';
//
// class WathList extends Equatable {
//   final int tmdbId;
//   final String title;
//   final String posterUrl;
//   final String backdropUrl;
//   final String reelaseDate;
//   final String overview;
//   final double voteAverage;
//   final bool isMovie;
//
//   const WathList({
//     required this.tmdbId,
//     required this.title,
//     required this.posterUrl,
//     required this.backdropUrl,
//     required this.reelaseDate,
//     required this.overview,
//     required this.voteAverage,
//     required this.isMovie,
//   });
//
//   factory WathList.fromWatchListItem(WatchListItem watchListItem) {
//     return WathList(
//       tmdbId: watchListItem.tmdbId,
//       title: watchListItem.title,
//       posterUrl: watchListItem.posterUrl,
//       backdropUrl: watchListItem.backdropUrl,
//       reelaseDate: watchListItem.releaseDate,
//       overview: watchListItem.overview,
//       voteAverage: watchListItem.voteAverage,
//       isMovie: watchListItem.,
//     );
//   }
//
//   @override
//   List<Object> get props => [
//         tmdbId,
//         title,
//         posterUrl,
//         backdropUrl,
//         reelaseDate,
//         overview,
//         voteAverage,
//         isMovie,
//       ];
// }
