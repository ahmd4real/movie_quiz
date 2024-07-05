import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/generated/l10n.dart';
import 'package:movie_quiz/models/data_file.dart'; // Ensure this path is correct based on your project structure

int currentQuestion = 0;

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  static const String id = "quiz_page";

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool answerState = false;
  int? _selectedAnswerIndex;
  bool? _isCorrect;

  void nextQuestion() {
    setState(() {
      answerState = false;
      _selectedAnswerIndex = null;
      _isCorrect = null;
      if (currentQuestion < data.length - 1) {
        currentQuestion++;
      } else {
        currentQuestion = -1;
      }
    });
  }

  void _selectAnswer(int index) {
    if (!answerState) {
      bool isCorrect = index == data[currentQuestion].answerIndex;
      setState(() {
        _selectedAnswerIndex = index;
        _isCorrect = isCorrect;
        answerState = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kBlack,
                kDarkPurple,
                kPurple,
              ],
            ),
          ),
          child: currentQuestion != -1
              ? QuizQuestion(
                  question: data[currentQuestion],
                  selectedAnswerIndex: _selectedAnswerIndex,
                  isCorrect: _isCorrect,
                  onAnswerSelected: _selectAnswer,
                )
              : Center(
                  child: Text(S.of(context).Quizfinished),
                ),
        ));
  }
}

class QuizQuestion extends StatelessWidget {
  final Question question;
  final int? selectedAnswerIndex;
  final bool? isCorrect;
  final Function(int) onAnswerSelected;

  const QuizQuestion({
    super.key,
    required this.question,
    required this.selectedAnswerIndex,
    required this.isCorrect,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(question.question,
          style: const TextStyle(
              fontSize: 30.0, color: Colors.white, fontFamily: kPrimeFont)),
      const SizedBox(height: 20.0),
      ...question.options.asMap().entries.map((entry) {
        int idx = entry.key;
        String answer = entry.value;
        Color buttonColor;

        if (selectedAnswerIndex == null) {
          buttonColor = noColor;
        } else if (idx == selectedAnswerIndex) {
          buttonColor = isCorrect! ? kGreen : kRed;
        } else {
          buttonColor = noColor;
        }

        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          width: 200.0,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: kLightBlue, width: 1.2),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: ElevatedButton(
            onPressed: selectedAnswerIndex == null
                ? () => onAnswerSelected(idx)
                : null,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  return buttonColor;
                },
              ),
            ),
            child: Text(
              answer,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: kPrimeFont),
            ),
          ),
        );
      }),
    ]));
  }
}
