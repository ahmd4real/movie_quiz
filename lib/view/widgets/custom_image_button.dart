import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';


class CustomImageButton extends StatelessWidget {
   const CustomImageButton(
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
  final void Function()? ontap;

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
      child: GestureDetector(
       
        onTap: ontap,
        //customBorder: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: color,
          backgroundImage: AssetImage(img),
          radius: MediaQuery.of(context).size.width * radiusRatio,
        ),
      ),
    );
  }
}
