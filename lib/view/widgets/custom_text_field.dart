import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  final String labelText;
  final TextEditingController controller;
  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: kWhite),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: kWhite),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: kWhite),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
            color: kWhite, fontFamily: font, fontSize: 20),
      ),
    );
  }
}
