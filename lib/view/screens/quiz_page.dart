import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/generated/l10n.dart';
import 'package:movie_quiz/models/data_file.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

int currentQuestion = 0;
int teamIndex = 0;

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
  final CountdownController _controller = CountdownController(autoStart: true);
  bool _quizStarted = false;

  void nextQuestion() {
    setState(() {
      answerState = false;
      _selectedAnswerIndex = null;
      _isCorrect = null;
      if (currentQuestion < data.length - 1) {
        teamIndex++;
        currentQuestion++;
      } else {
        currentQuestion = -1;
      }
      _controller.restart();
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

      Future.delayed(const Duration(milliseconds: 300), () {
        nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          color: kBackgroundColor,
        ),
        child: _quizStarted
            ? currentQuestion != -1
                ? QuizQuestion(
                    question: data[currentQuestion],
                    selectedAnswerIndex: _selectedAnswerIndex,
                    isCorrect: _isCorrect,
                    onAnswerSelected: _selectAnswer,
                    controller: _controller,
                    onNextQuestion: nextQuestion,
                  )
                : Center(
                    child: Text(S.of(context).Quizfinished),
                  )
            : Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(kDarkBlue),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.0),
                        ),
                      )),
                  onPressed: () {
                    setState(() {
                      _quizStarted = true;
                      _controller.start();
                    });
                  },
                  child: Text(
                    currentQuestion == 0 ? "ابدأ" : "اللي بعده",
                    style: const TextStyle(
                        color: kWhite,
                        fontFamily: font,
                        fontWeight: FontWeight.w700,
                        fontSize: 48),
                  ),
                ),
              ),
      ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final CountdownController controller;
  final Question question;
  final int? selectedAnswerIndex;
  final bool? isCorrect;
  final Function(int) onAnswerSelected;
  final VoidCallback onNextQuestion;

  QuizQuestion({
    super.key,
    required this.question,
    required this.selectedAnswerIndex,
    required this.isCorrect,
    required this.onAnswerSelected,
    required this.controller,
    required this.onNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(teamNames[teamIndex],
            style: const TextStyle(
                color: kYellow2, fontFamily: teamFont, fontSize: 48)),
        const SizedBox(height: 48),
        Text(question.question,
            style: const TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: font)),
        const SizedBox(height: 20.0),
        ...question.options.asMap().entries.map((entry) {
          int idx = entry.key;
          String answer = entry.value;
          Color buttonColor;

          if (selectedAnswerIndex == null) {
            buttonColor = kQuiestionColor;
          } else if (idx == selectedAnswerIndex) {
            buttonColor = isCorrect! ? kGreen : kRed;
          } else {
            buttonColor = kQuiestionColor;
          }

          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 7.0,
            ),
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 202, 45),
              border: Border.all(color: kQuiestionColor, width: 1.2),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                controller.pause();
                selectedAnswerIndex == null ? onAnswerSelected(idx) : null;
              },
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
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: font),
              ),
            ),
          );
        }),
        const SizedBox(
          height: 32,
        ),
        Countdown(
            controller: controller,
            seconds: 30,
            build: (_, double time) => Text(
                  time.toString(),
                  style: const TextStyle(
                    fontSize: 100,
                    fontFamily: font,
                    color: kOrange,
                  ),
                ),
            interval: const Duration(milliseconds: 100),
            onFinished: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 200),
                  content: Center(
                      child: Text(
                    'وقتك خلص يسطا😩',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 24,
                    ),
                  )),
                ),
              );
              onNextQuestion();
            }),
        ElevatedButton(
            onPressed: () {
              controller.start();
              onNextQuestion();
            },
            child: const Text(
              "اللي بعده",
              style: TextStyle(
                  fontFamily: font, fontWeight: FontWeight.w700, fontSize: 24),
            ))
      ]),
    );
  }
}
