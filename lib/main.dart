// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/views/auth/log_in.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/views/products/products.dart';

import 'services/stroage_manager.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await checkUser();
  runApp(const MyApp());
}

String username = '';
String password = '';
Future checkUser() async {
  username = await StroageManager().getUserName();
  password = await StroageManager().getUserPassword();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.openSansTextTheme()),
        home: username == "" ? const LogIn() : const Products());
  }
}
