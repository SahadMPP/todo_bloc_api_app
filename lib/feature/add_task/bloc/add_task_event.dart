part of 'add_task_bloc.dart';

@immutable
sealed class AddTaskEvent {}

class AddTaskOnButtonClickEvent extends AddTaskEvent {
  final TextEditingController textTitlecontroller;
  final TextEditingController textDiscriptioncontroller;
  final dynamic contex;

  AddTaskOnButtonClickEvent(
      {required this.textTitlecontroller,
      required this.textDiscriptioncontroller,
      required this.contex});
}
