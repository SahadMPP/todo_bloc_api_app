import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeAddTaskBottonNavigationEvent>(homeAddTaskBottonNavigationEvent);
    on<HomeViewTaskBottonNavigationEvent>(homeViewTaskBottonNavigationEvent);
  }

  FutureOr<void> homeAddTaskBottonNavigationEvent(
      HomeAddTaskBottonNavigationEvent event, Emitter<HomeState> emit) {
    log('going to AddTask');
    emit(HomeNavigatToAddTaskPage());
  }

  FutureOr<void> homeViewTaskBottonNavigationEvent(
      HomeViewTaskBottonNavigationEvent event, Emitter<HomeState> emit) {
    log('going to viewTask');
    emit(HomeNavigatToViewTaskPage());
  }
}
