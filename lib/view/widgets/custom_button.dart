import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.color1,
      required this.color2,
      required this.text,
      this.onTap});
  final Color color1, color2;
  final String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 12,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          decoration: BoxDecoration(
            border: Border.all(width: 2,color: Colors.amber),
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [color1, color2])),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 5,
              maxWidth: MediaQuery.of(context).size.width / 1.5,
            ),
            child: FittedBox(
              child: Text(
                text,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: font),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
