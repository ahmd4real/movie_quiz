import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/home_page.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({required this.labelText,this.keyboardType = TextInputType.none,super.key});
  final String labelText;
  TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
            onChanged: (value) => NumebrOfTeams = int.parse(value),
            keyboardType: keyboardType,
            decoration:  InputDecoration(
              border: const OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(12.0)),
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
              labelStyle: const TextStyle(color: kWhite,fontFamily: font,fontSize: 20),
            ),
          );
  }
}