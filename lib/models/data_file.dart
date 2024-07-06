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
  Question(question: "احنا  الأتوبيس", answerIndex: 0, options: [
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
    "اللwerمبي",
    "الكيف",
  ]),
  Question(question: "احنا بتوع الأتوبيس", answerIndex: 0, options: [
    "احنا بتوع الأتوبيس",
    "الerلمبي",
    "الكيف",
  ]),
  Question(question: "احنا  الأتوبيس", answerIndex: 0, options: [
    "hاحنا بتوع erwالأتوبيس",
    "اللمبhي",
    "الhكيف",
  ]),
  Question(question: "احنا بتوع الأتوبيس", answerIndex: 0, options: [
    "احنا بتوعqer الأتوبيس",
    "اللhمبي",
    "الhكيف",
  ]),
  Question(question: "احنا بتوع الأتوبيس", answerIndex: 0, options: [
    "احنerا بتوع الأتوبيس",
    "اwerللمبي",
    "اfdلكيف",
  ]),
];
