// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:testapp/controller/products_controller.dart';
import 'package:testapp/services/stroage_manager.dart';
import 'package:testapp/utils/app_colors.dart';
import 'package:testapp/utils/app_size.dart';
import 'package:testapp/utils/navigator.dart';
import 'package:testapp/views/products/products.dart';

import '../widget/custom_snackbar.dart';
import '../widget/under_line_text_field.dart';
import 'package:get/get.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

final username = TextEditingController();
final password = TextEditingController();

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [AppColors.bgColor1, AppColors.bgColor2])),
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.45,
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        "STC\nHEALTH",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppSize.height(context) * 0.08,
            ),
            SizedBox(
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    UnderLineTextField(
                      label: 'Username',
                      controller: username,
                      icon: '',
                    ),
                    SizedBox(
                      height: AppSize.height(context) * 0.03,
                    ),
                    UnderLineTextField(
                      label: 'Password',
                      controller: password,
                      icon: '',
                      passwordText: true,
                      showIcon: true,
                    ),
                    SizedBox(
                      height: AppSize.height(context) * 0.08,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.bgColor2,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fixedSize: Size(AppSize.width(context),
                              AppSize.height(context) * 0.07),
                        ),
                        onPressed: () async {
                          if (username.text.trim() != '' &&
                              password.text.trim() != '') {
                            await controller
                                .userLogin(
                                    username: username.text.trim(),
                                    passwrod: password.text.trim())
                                .then((value) {
                              navigateTo(const Products());
                            });

                            await StroageManager()
                                .setUserName(username: username.text);
                            await StroageManager()
                                .setPassword(password: password.text);
                          } else {
                            customSnakBar(
                                color: Colors.red,
                                msg: 'enter vaild username or password ');
                          }
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        )),
                    SizedBox(
                      height: AppSize.height(context) * 0.06,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text("NEED HELP?"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
