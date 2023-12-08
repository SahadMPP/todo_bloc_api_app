import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/screens/add_task.dart';
import 'package:to_do/screens/update_task.dart';
import 'package:to_do/task/task_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> load() async {
      return context.read<TaskBloc>().add(Getvalue());
    }

    load();
    // print('app rebuilding');
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: 100,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddTaskScreen()));
            },
            child: const Text(
              'Add Task',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDo'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: load,
            child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (ctx, index) {
                final item = state.items[index] as Map;
                final id = item["_id"] as String;
                // print('widget rebuilding');
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'Edit') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => UpdateTaskScreen(todo: item)));
                      }
                      if (value == 'delete') {
                        context.read<TaskBloc>().add(Delete(id: id));
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: 'Edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('delete'),
                        ),
                      ];
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
