import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_quiz/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.labelText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.errorMsg = 'ما تقول كام يعم',
      super.key,
      this.inputFormatters});

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String errorMsg;
  List<TextInputFormatter>? inputFormatters;
  Color borderColor = Colors.white24; 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMsg;
        }
        return null;
      },
      inputFormatters: inputFormatters,
      cursorColor: kYellow,
      style: const TextStyle(color: kWhite, fontFamily: font),
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
            color: kErrorBorderColor, fontFamily: font, fontSize: 16),
        border:  OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.white38, width: 2),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: kErrorBorderColor),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: kErrorBorderColor),
        ),
        labelText: labelText,
       // hintStyle: const TextStyle(color: Colors.amber),
        labelStyle:
             TextStyle(color: kWhite, fontFamily: font, fontSize: 20),
      ),
    );
  }
}
