import 'package:flutter/material.dart';
import 'package:okapi_z/core/constants/palatte.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget icon; // IconData 대신 Widget으로 수정
  final String hintText;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icon, // Icon 위젯 대신, 전달된 위젯을 사용
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
