import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

// ignore: must_be_immutable
class UnderLineTextField extends StatefulWidget {
  UnderLineTextField(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon,
      this.showIcon = false,
      this.passwordText = false,
      this.readOnly = false});
  final String label;
  final TextEditingController controller;
  final String icon;
  final bool readOnly;
  final bool showIcon;
  bool passwordText;

  @override
  State<UnderLineTextField> createState() => _UnderLineTextFieldState();
}

class _UnderLineTextFieldState extends State<UnderLineTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.passwordText,
      readOnly: widget.readOnly,
      controller: widget.controller,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey),
          ),
          suffixIcon: widget.showIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.passwordText = !widget.passwordText;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye))
              : const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
          labelStyle: const TextStyle(color: Colors.black),
          label: Text(
            widget.label,
            style: const TextStyle(fontSize: 15),
          )),
    );
  }
}
