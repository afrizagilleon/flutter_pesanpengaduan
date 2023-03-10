import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/screens/list_users.dart';
import 'package:laporan_masyarakat/screens/report_list_admin.dart';

import '../screens/dashboard_screen.dart';

class AdminNavbar extends StatefulWidget {
  const AdminNavbar({Key? key}) : super(key: key);

  @override
  State<AdminNavbar> createState() => _AdminNavbarState();
}

class _AdminNavbarState extends State<AdminNavbar> {
  int _selected_index = 0;
  final indexs = const [
    DashboardScreen(),
    ListUsers(),
    ReportListAdmin(),
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
                  Icons.supervised_user_circle_outlined,
                  size: 30,
                ),
                selectedIcon: Icon(
                  Icons.supervised_user_circle,
                  size: 32,
                ),
                label: Text(
                  'User List',
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
