import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
     // required this.color,
      this.fontSize = 32,
      required this.buttonWidth,
      this.onTap,
      required this.text,
      this.weight = FontWeight.w600});
  final String text;
  //final Color color;
  final double fontSize,buttonWidth;
  final Function()? onTap;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      width: MediaQuery.of(context).size.width * buttonWidth,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 0.01,
          ),
        ],
        gradient: const LinearGradient(
            colors: [kYellow, Color.fromARGB(255, 255, 210, 8)]),
        color: kYellow,
        border: Border.all(color: kYellow, width: 1.2),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(3),
            overlayColor:
                WidgetStateProperty.all(Colors.black.withOpacity(0.5)),
            shadowColor: WidgetStateProperty.all(Colors.black),
            backgroundColor: WidgetStateProperty.all(kQuiestionColor)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 5,
            maxWidth: MediaQuery.of(context).size.width / buttonWidth,
          ),
          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(
                  color: kWhite,
                  fontFamily: font,
                  fontWeight: weight,
                  fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
