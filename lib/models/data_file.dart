import 'dart:core';

class Question {
  String question;
  final List<String>options;
  int answerIndex;
  Question(
      {required this.question,
      required this.options,
      required this.answerIndex});
}

final data = [
  Question(question: "احنا بتوع الأتوبيس", answerIndex: 0, options: [
    "احنا بتوع الأتوبيس",
    "اللمبي",
    "الكيف",
  ]),
  Question(question: "احنا بتوع الأتوبيس", answerIndex: 0, options: [
    "احنا بتوع الأتوبيس",
    "اللمبي",
    "الكيف",
  ]),
  Question(question: "احنا بتوع الأتوبيس", answerIndex: 0, options: [
    "احنا بتوع الأتوبيس",
    "اللمبي",
    "الكيف",
  ]),
  Question(question: "احنا بتوع الأتوبيس", answerIndex: 0, options: [
    "احنا بتوع الأتوبيس",
    "اللمبي",
    "الكيف",
  ]),
];
