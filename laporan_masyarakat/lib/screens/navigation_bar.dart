import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/providers/auth_provider.dart';
import 'package:laporan_masyarakat/screens/dashboard_screen.dart';
import 'package:laporan_masyarakat/screens/report_list_user.dart';
import 'package:laporan_masyarakat/screens/report_user_screen.dart';
import 'package:laporan_masyarakat/widgets/admin_navbar.dart';
import 'package:laporan_masyarakat/widgets/user_navbar.dart';
import 'package:provider/provider.dart';

class NavigationBarCustom extends StatefulWidget {
  const NavigationBarCustom({Key? key}) : super(key: key);

  @override
  State<NavigationBarCustom> createState() => _NavigationBarCustomState();
}

class _NavigationBarCustomState extends State<NavigationBarCustom> {

  @override
  Widget build(BuildContext context) {
    String username = context.read<AuthProvider>().username;
    String level = context.read<AuthProvider>().level;
    // print(username);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaduan Masyarakat'),
        actions:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: CircleAvatar(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: Center(
              child: Text(username),
            ),
          )
        ],
      ),
      body: level == 'admin' ? const AdminNavbar() : const UserNavbar(),
    );
  }
}
