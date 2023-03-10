import 'package:flutter/material.dart';
import 'package:laporan_masyarakat/providers/auth_provider.dart';
import 'package:laporan_masyarakat/screens/login_screen.dart';
import 'package:laporan_masyarakat/screens/navigation_bar.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> AuthProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pengaduan masyarakat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      initialRoute: '/login',
      routes: {
        '/login' : (context) => LoginScreen(),
        '/home' : (context) => NavigationBarCustom(),
      },
    );
  }
}

