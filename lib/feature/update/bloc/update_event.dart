part of 'update_bloc.dart';

@immutable
sealed class UpdateEvent {}

class UpdateDateOnButtonClick extends UpdateEvent {
  final TextEditingController textTitlecontroller;
  final TextEditingController textDiscriptioncontroller;
  final dynamic contex;
  final dynamic todo;

  UpdateDateOnButtonClick({
    required this.textTitlecontroller,
    required this.textDiscriptioncontroller,
    required this.contex,
    required this.todo,
  });
}
