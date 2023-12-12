import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/feature/list_of_task/task/task_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> load() async {
      return context.read<TaskBloc>().add(Getvalue());
    }

    load();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: 'Search here',
              hintStyle: GoogleFonts.aBeeZee(letterSpacing: 1),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
        ),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: load,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (ctx, index) {
                  final item = state.items[index] as Map;
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 238, 238, 238),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            item['title'],
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            item['description'],
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
