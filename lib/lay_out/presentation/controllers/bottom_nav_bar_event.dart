part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();
}

// class GetBottomNavBarPageStartedEvent extends BottomNavBarEvent {
//   final int index;
//
//   const GetBottomNavBarPageStartedEvent({required this.index});
//
//   @override
//   List<Object> get props => [index];
// }

class GetBottomNavBarPageTappedEvent extends BottomNavBarEvent {
  final int index;

  const GetBottomNavBarPageTappedEvent({required this.index});

  @override
  List<Object> get props => [index];
}
