// ignore_for_file: depend_on_referenced_packages

import 'package:shared_preferences/shared_preferences.dart';

class StroageManager {
  Future<bool> setUserName({
    required String username,
  }) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    return pre.setString("username", username);
  }

  Future<bool> setPassword({required String password}) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    return pre.setString("password", password);
  }

  Future<String> getUserName() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String name = pre.getString("username") ?? "";
    return name;
  }

  Future<String> getUserPassword() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String password = pre.getString("password") ?? "";
    return password;
  }
}
