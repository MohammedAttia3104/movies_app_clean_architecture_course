// import 'dart:async';
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app_clean_architecture_course/core/constants/app_strings.dart';
// import 'package:movies_app_clean_architecture_course/movies/presentation/screens/movies_screen/movies_screen.dart';
// import 'package:movies_app_clean_architecture_course/search/presentation/pages/search_screen.dart';
// import 'package:movies_app_clean_architecture_course/tvs/presentation/pages/tv_screen/tv_screen.dart';
//
// part 'bottom_nav_bar_event.dart';
//
// part 'bottom_nav_bar_state.dart';
//
// class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
//   int currentIndex = 0;
//   List<Widget> bottomNavBarScreens = [
//     const MovieScreen(),
//     const TvScreen(),
//     const SearchScreen(title: ''),
//   ];
//
//   List<String> bottomNavBarIconTitle = [
//     AppStrings.movie,
//     AppStrings.tv,
//     AppStrings.search,
//   ];
//
//   List<IconData> bottomNavBarIcon = [
//     Icons.movie_creation_rounded,
//     Icons.tv_rounded,
//     Icons.search_rounded,
//   ];
//
//   BottomNavBarBloc() : super(BottomNavBarInitial()) {
//     on<GetBottomNavBarPageTappedEvent>(_getBottomNavScreen);
//   }
//
//   FutureOr<void> _getBottomNavScreen(
//       GetBottomNavBarPageTappedEvent event, Emitter<BottomNavBarState> emit) {
//     currentIndex = event.index;
//     emit(BottomNavBarChangedState());
//   }
// }
