
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  String username = '';
  String password = '';
  String level = '';
  int id_user = 0;
  String phone = '';

//<editor-fold desc="Data Methods">

  AuthProvider();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthProvider &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          password == other.password &&
          level == other.level &&
          id_user == other.id_user &&
          phone == other.phone);

  @override
  int get hashCode =>
      username.hashCode ^
      password.hashCode ^
      level.hashCode ^
      id_user.hashCode ^
      phone.hashCode;

  @override
  String toString() {
    return 'AuthProvider{ username: $username, password: $password, level: $level, id_user: $id_user, phone: $phone,}';
  }


  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'password': this.password,
      'level': this.level,
      'id_user': this.id_user,
      'phone': this.phone,
    };
  }

  void fromMap(Map<String, dynamic> map) {
      this.username = map['username'] as String;
      this.password = map['password'] as String;
      this.level = map['level'] as String;
      this.id_user = map['id_user'] as int;
      this.phone = map['phone'] as String;
    notifyListeners();
  }


//</editor-fold>

}