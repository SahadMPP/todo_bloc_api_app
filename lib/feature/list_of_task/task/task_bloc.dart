import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(InitialState()) {
    on<Getvalue>((event, emit) async {
      const url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
      final uri = Uri.parse(url);
      final respons = await http.get(uri);
      if (respons.statusCode == 200) {
        final json = jsonDecode(respons.body) as Map;
        final result = json['items'] as List;
        return emit(TaskState(items: result, isLoading: false));
      }
    });

    on<Delete>((event, emit) async {
      final url = 'https://api.nstack.in/v1/todos/${event.id}';
      final uri = Uri.parse(url);
      final response = await http.delete(uri);
      if (response.statusCode == 200) {
        final item = state.items
            .where((element) => (element)['_id'] != event.id)
            .toList();
        return emit(TaskState(items: item));
      } else {
        // ignore: avoid_print
        print('delete is faield');
      }
    });
  }
}
