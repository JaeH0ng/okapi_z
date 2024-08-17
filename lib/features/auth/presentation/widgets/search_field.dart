import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          filled: true,
          fillColor: Palette.inputGray,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              'assets/icons/search_input.svg',
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/icons/search_calendar.svg',
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
