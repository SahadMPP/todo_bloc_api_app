part of 'task_bloc.dart';

class TaskState {
  List items;
  bool? isLoading;
  TaskState({required this.items, this.isLoading});
}

class InitialState extends TaskState {
  InitialState() : super(items: [], isLoading: true);
}
