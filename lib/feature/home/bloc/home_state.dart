part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeNavigatToViewTaskPage extends HomeActionState {}

class HomeNavigatToAddTaskPage extends HomeActionState {}
