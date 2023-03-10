import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:laporan_masyarakat/constants/contant.dart';
import 'package:laporan_masyarakat/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String _username;
  late String _password;
  late bool _is_success;

  Future fetchPost() async {
    final response =
    await http.post(Uri.parse('${Constant.apiLogin}?username=$_username&password=$_password'));

    if(jsonDecode(response.body)['username'] != null){
      final parsed = jsonDecode(response.body);
      return {'ok' : 'oke', 'parsed' : parsed};
    }

    return 'nah';
  }

  void login(){
    fetchPost().then((val) => {
      setState(()=>{
        if(val['ok'] == 'oke'){
          context.read<AuthProvider>().fromMap(val['parsed']),
          Navigator.pushNamed(context, '/home')
        }
      })
    });
  }

  void setUsername(username){
    setState(() {
      _username = username;
    });
  }

  void setPasswrod(password){
    setState(() {
      _password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 500,
          child: Column(
            children: [
              TextField(
                onChanged: setUsername,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan username anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            const Gap(20),
            TextField(
              onChanged: setPasswrod,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan password anda',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
              const Gap(20),
              ElevatedButton.icon(
                  onPressed: login,
                  icon: const Icon(Icons.login),
                  label: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
