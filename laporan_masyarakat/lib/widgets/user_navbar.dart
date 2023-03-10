
import 'package:flutter/material.dart';

import '../screens/dashboard_screen.dart';
import '../screens/report_list_user.dart';
import '../screens/report_user_screen.dart';

class UserNavbar extends StatefulWidget {
  const UserNavbar({Key? key}) : super(key: key);

  @override
  State<UserNavbar> createState() => _UserNavbarState();
}

class _UserNavbarState extends State<UserNavbar> {
  int _selected_index = 0;
  final indexs = const [
    DashboardScreen(),
    ReportUser(),
    ReportListUser(),
  ];

  void changeSelectedIndex(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
            onDestinationSelected: changeSelectedIndex,
            leading: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset('assets/images/201623.png', width: 120),
              ),
            ),
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(
                  Icons.dashboard_outlined,
                  size: 30,
                ),
                selectedIcon: Icon(
                  Icons.dashboard,
                  size: 32,
                ),
                label: Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.report_problem_outlined,
                  size: 30,
                ),
                selectedIcon: Icon(
                  Icons.report_problem,
                  size: 32,
                ),
                label: Text(
                  'Report',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.list_outlined,
                  size: 30,
                ),
                selectedIcon: Icon(
                  Icons.list,
                  size: 32,
                ),
                label: Text(
                  'Report List',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
            selectedIndex: _selected_index),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child:
          indexs[_selected_index],
        )
      ],
    );
  }
}
