import 'package:flutter/material.dart';
import 'package:to_do/feature/home/ui/home_ui.dart';
import 'package:to_do/feature/profile/ui/profile.dart';

class BuildBottomNavigator extends StatefulWidget {
  const BuildBottomNavigator({super.key});

  @override
  State<BuildBottomNavigator> createState() => _BuildBottomNavigatorState();
}

class _BuildBottomNavigatorState extends State<BuildBottomNavigator> {
  List<Widget> pages = [
    const HomeMain(),
    const ProfileScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        // backgroundColor: Colors.white,
        height: 65,
        // indicatorColor: Colors.white,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, size: 30),
            label: 'profile',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
