part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class Getvalue extends TaskEvent {}

class Delete extends TaskEvent {
  final String id;

  Delete({required this.id});
}
