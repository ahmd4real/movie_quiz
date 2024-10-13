import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:timer_count_down/timer_controller.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton(
      {super.key,
      required this.answer,
      required this.controller,
      required this.selectedAnswerIndex,
      required this.onAnswerSelected,
      required this.idx,
      required this.buttonColor});
  final String answer;
  final CountdownController controller;
  final int idx;
  int? selectedAnswerIndex;
  Color buttonColor;
  final Function(int) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      child: CustomButton(
        color1: buttonColor,
        color2: buttonColor,
        text: answer,
        onTap: () {
          controller.pause();
          selectedAnswerIndex == null ? onAnswerSelected(idx) : null;
        },
      ),
    );

    // ignore: dead_code
    Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: MediaQuery.of(context).size.width / 1.5,
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
        onPressed: () {
          controller.pause();
          selectedAnswerIndex == null ? onAnswerSelected(idx) : null;
        },
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(3),
          overlayColor: WidgetStateProperty.all(Colors.black.withOpacity(0.5)),
          shadowColor: WidgetStateProperty.all(Colors.black),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              return buttonColor;
            },
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 5,
            maxWidth: MediaQuery.of(context).size.width / 1.5,
          ),
          child: FittedBox(
            child: Text(
              answer,
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
    );
  }
}
