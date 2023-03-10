import 'package:flutter/cupertino.dart';
import 'package:laporan_masyarakat/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String level = context.read<AuthProvider>().level;
    String username = context.read<AuthProvider>().username;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        children:  [
          Text('Welcome ${level=='admin'? 'Admin,' : ''} $username', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20),)
        ],
      ),
    );
  }
}
