part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeViewTaskBottonNavigationEvent extends HomeEvent {}

class HomeAddTaskBottonNavigationEvent extends HomeEvent {}
