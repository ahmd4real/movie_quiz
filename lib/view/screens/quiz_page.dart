import 'package:flutter/material.dart';

import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/models/data_file.dart';
import 'package:movie_quiz/view/screens/results_page.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_slide_transition.dart';

import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.teamNames,required this.questionsNumber});
  final List<String> teamNames;
  final int questionsNumber;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int teamIndex = 0;
  List<int> teamQuestionCount = [];
  List<int> score = [];
  List<int> questionOrder = [];
  int currentQuestion = 0;
  bool answerState = false;
  int? _selectedAnswerIndex;
  bool? _isCorrect;
  final CountdownController controller = CountdownController(autoStart: true);
  bool quizStarted = false;
  int totalQuestionsAsked = 0;

  @override
  void initState() {
    super.initState();
    teamQuestionCount = List.filled(widget.teamNames.length, 0);
    score = List.filled(widget.teamNames.length, 0);
    questionOrder = List.generate(data.length, (index) => index);
    questionOrder.shuffle();
    currentQuestion = questionOrder[0];
  }

  void nextQuestion() {
    setState(() {
      answerState = false;
      _selectedAnswerIndex = null;
      _isCorrect = null;
      teamQuestionCount[teamIndex]++;
      totalQuestionsAsked++;

      //10 is number of questions per team
      if (totalQuestionsAsked >= widget.teamNames.length * widget.questionsNumber) {
        currentQuestion = -1;
      } else {
        teamIndex = (teamIndex + 1) % widget.teamNames.length;
        currentQuestion =
            questionOrder[totalQuestionsAsked % questionOrder.length];
        controller.restart();
      }
    });
  }

  void _selectAnswer(int index) {
    if (!answerState) {
      bool isCorrect = index == data[currentQuestion].answerIndex;
      setState(() {
        score[teamIndex] += isCorrect ? 1 : 0;
        _selectedAnswerIndex = index;
        _isCorrect = isCorrect;
        answerState = true;
      });

      Future.delayed(const Duration(milliseconds: 500), () {
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
        child: quizStarted
            ? currentQuestion != -1
                ? QuizQuestion(
                    teamIndex: teamIndex,
                    question: data[currentQuestion],
                    selectedAnswerIndex: _selectedAnswerIndex,
                    isCorrect: _isCorrect,
                    onAnswerSelected: _selectAnswer,
                    controller: controller,
                    onNextQuestion: nextQuestion,
                    teamNames: widget.teamNames,
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            buttonWidth: 0.83,
                            text: "مين اللي كسب",
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(ResultsPage(
                                      questionsNumber: widget.questionsNumber,
                                      teamNames: widget.teamNames,
                                      score: score)));
                            }),
                      ],
                    ),
                  )
            : Center(
                child: Countdown(
                    controller: controller,
                    seconds: 1,
                    build: (_, double time) => WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.pulse(),
                        child: Image.asset(logoWhite)),
                    interval: const Duration(milliseconds: 100),
                    onFinished: () {
                      setState(() {
                        quizStarted = true;
                      });
                    }),
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
  final List<String> teamNames;
  final int teamIndex;

  const QuizQuestion({
    super.key,
    required this.question,
    required this.selectedAnswerIndex,
    required this.isCorrect,
    required this.onAnswerSelected,
    required this.controller,
    required this.onNextQuestion,
    required this.teamNames,
    required this.teamIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 4.5,
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            child: FittedBox(
              child: Text(
                overflow: TextOverflow.fade,
                teamNames[teamIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: kYellow,
                    fontFamily: font,
                    fontSize: 32),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Text(question.question,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: font)),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ...question.options.asMap().entries.map((entry) {
            int idx = entry.key;
            String answer = entry.value;
            Color buttonColor;

            if (selectedAnswerIndex == null) {
              buttonColor = kQuiestionColor;
            } else if (idx == selectedAnswerIndex) {
              buttonColor = isCorrect! ? kGreen : kRed;
            } else if (idx == question.answerIndex) {
              buttonColor = kGreen;
            } else {
              buttonColor = kQuiestionColor;
            }

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 7.0),
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
                  overlayColor:
                      WidgetStateProperty.all(Colors.black.withOpacity(0.5)),
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
          }),
          const SizedBox(height: 16),
          Countdown(
              controller: controller,
              seconds: 30,
              build: (_, double time) => Text(
                    time.toInt().toString(),
                    style: const TextStyle(
                        fontSize: 100,
                        fontFamily: font,
                        color: kYellow,
                        fontWeight: FontWeight.w900),
                  ),
              interval: const Duration(seconds: 1),
              onFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 500),
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
        ]),
      ),
    );
  }
}
