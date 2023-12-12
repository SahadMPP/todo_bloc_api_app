import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/build_widger/home_appbar.dart';
import 'package:to_do/build_widger/home_big_box.dart';
import 'package:to_do/build_widger/home_box_one.dart';
import 'package:to_do/build_widger/home_card.dart';
import 'package:to_do/feature/add_task/ui/add_task_ui.dart';
import 'package:to_do/feature/home/bloc/home_bloc.dart';
import 'package:to_do/feature/list_of_task/ui/list_of_task_ui.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeNavigatToAddTaskPage) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const DataAddUI()));
        } else if (state is HomeNavigatToViewTaskPage) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const ListOfTask()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appbar(context),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const HomeCard(),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: SizedBox(
                      height: 420,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 180,
                            height: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDatePicker(
                                          context: context,
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(3000));
                                    },
                                    child: const BuildSmallBoxHome(
                                        text1: 'View',
                                        text2: 'Calender',
                                        image:
                                            'asset/images-calander-removebg-preview.png'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      homeBloc.add(
                                          HomeAddTaskBottonNavigationEvent());
                                    },
                                    child: const BuildBIgBoxHome(
                                        text1: "Add New",
                                        text2: "Task",
                                        image:
                                            'asset/images__1_-removebg-preview.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            height: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        homeBloc.add(
                                            HomeViewTaskBottonNavigationEvent());
                                      },
                                      child: const BuildBIgBoxHome(
                                          text1: "View All",
                                          text2: "Task",
                                          image:
                                              'asset/Screenshot 2023-12-09 165120.png'),
                                    ),
                                    const BuildSmallBoxHome(
                                        text1: 'View',
                                        text2: 'My Status',
                                        image:
                                            'asset/images__8_-removebg-preview.png'),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
