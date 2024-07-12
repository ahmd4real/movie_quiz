import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';

import 'package:movie_quiz/view/screens/home_page.dart';

class CustomImageButton extends StatelessWidget {
   CustomImageButton(
      {super.key,
      this.ontap,
      required this.img,
      required this.color,
      this.shadowColor=noColor,
      this.borderColor = noColor,
      required this.radiusRatio});

  final String img;
  final Color color, borderColor,shadowColor;
  final double radiusRatio;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          shape: BoxShape.circle,
          boxShadow:  [
            BoxShadow(
                color: shadowColor,
                spreadRadius: 1,
                blurRadius: 15)
          ]),
      child: Material(
        shape: const CircleBorder(),
        child: InkWell(
          splashColor: Colors.black,
          onTap: ontap,
          customBorder: const CircleBorder(),
          child: Ink(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundColor: color,
              backgroundImage: AssetImage(img),
              radius: MediaQuery.of(context).size.width * radiusRatio,
            ),
          ),
        ),
      ),
    );
  }
}
