import 'package:flutter/material.dart';
import 'package:okapi_z/core/constants/palatte.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;

  const SearchField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 129, 131, 133)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
