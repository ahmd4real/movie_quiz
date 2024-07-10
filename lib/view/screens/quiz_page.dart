import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/models/data_file.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/results_page.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_image_button.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

int teamIndex = 0;
List<int> teamQuestionCount = List.filled(numberOfTeams, 0);
List<int> score = List.filled(numberOfTeams, 0);
List<int> questionOrder = List.generate(data.length,
    (index) => index); // Generate a list of indices for the questions
int currentQuestion = Random().nextInt(data.length);
bool answerState = false;
int? _selectedAnswerIndex;
bool? _isCorrect;
final CountdownController controller = CountdownController(autoStart: true);
bool quizStarted = false;
int totalQuestionsAsked = 0;

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  static const String id = "quiz_page";

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // bool answerState = false;
  // int? _selectedAnswerIndex;
  // bool? _isCorrect;
  // final CountdownController controller = CountdownController(autoStart: true);
  // bool quizStarted = false;
  // int totalQuestionsAsked = 0;

  @override
  void initState() {
    super.initState();
    questionOrder.shuffle(); // Shuffle the question order at the start
  }

  void nextQuestion() {
    setState(() {
      answerState = false;
      _selectedAnswerIndex = null;
      _isCorrect = null;
      teamQuestionCount[teamIndex]++;
      totalQuestionsAsked++;

      if (totalQuestionsAsked >= numberOfTeams * 10) {
        currentQuestion = -1;
      } else {
        teamIndex = (teamIndex + 1) % teamNames.length;
        currentQuestion = questionOrder[totalQuestionsAsked %
            questionOrder.length]; // Get the next question in order
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

      Future.delayed(const Duration(milliseconds: 300), () {
        nextQuestion();
      });
    }
  }

  // void nextQuestion() {
  //   setState(() {
  //     answerState = false;
  //     _selectedAnswerIndex = null;
  //     _isCorrect = null;
  //     teamQuestionCount[teamIndex]++;
  //     totalQuestionsAsked++;

  //     if (totalQuestionsAsked >= numberOfTeams * 10) {
  //       currentQuestion = -1;
  //     } else {
  //       teamIndex = (teamIndex + 1) % teamNames.length;
  //       currentQuestion = questionOrder[totalQuestionsAsked % questionOrder.length]; // Get the next question in order
  //       controller.restart();
  //     }
  //   });
  // }

  // void _selectAnswer(int index) {
  //   if (!answerState) {
  //     bool isCorrect = index == data[currentQuestion].answerIndex;
  //     setState(() {
  //       score[teamIndex] += isCorrect ? 1 : 0;
  //       _selectedAnswerIndex = index;
  //       _isCorrect = isCorrect;
  //       answerState = true;
  //     });

  //     Future.delayed(const Duration(milliseconds: 300), () {
  //       nextQuestion();
  //     });
  //   }
  // }

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
                    question: data[currentQuestion],
                    selectedAnswerIndex: _selectedAnswerIndex,
                    isCorrect: _isCorrect,
                    onAnswerSelected: _selectAnswer,
                    controller: controller,
                    onNextQuestion: nextQuestion,
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            color: kMove,
                            text: "مين اللي كسب",
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, ResultsPage.id);
                            }),
                      ],
                    ),
                  )
            : Center(
                child: CustomImageButton(
                ontap: () {
                  setState(() {
                    quizStarted = true;
                    controller.start();
                  });
                },
                img: buttonImg2,
                color: kYellow2,
                radiusRatio: .30,
                shadowColor:const Color.fromARGB(255, 255, 146, 3)
              )),
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

  const QuizQuestion({
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
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Text(question.question,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
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
            
            margin: const EdgeInsets.symmetric(
              vertical: 7.0,
            ),
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
             gradient: const LinearGradient(colors: [
              kYellow2,Color.fromARGB(255, 255, 210, 8)
             ]),
              color: kYellow2,
              border: Border.all(color: kYellow2, width: 1.2),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                controller.pause();
                selectedAnswerIndex == null ? onAnswerSelected(idx) : null;
              },
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(2),
                overlayColor: WidgetStateProperty.all(Colors.black),
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
        const SizedBox(
          height: 32,
        ),
        Countdown(
            controller: controller,
            seconds: 30,
            build: (_, double time) => Text(
                  time.toInt().toString(),
                  style: const TextStyle(
                      fontSize: 100,
                      fontFamily: font,
                      color: kOrange,
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
              //onNextQuestion();
            }),
      ]),
    );
  }
}
