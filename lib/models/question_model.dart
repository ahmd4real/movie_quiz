import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String question;
  final List<String> options;
  int answerIndex;
  Question({
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  factory Question.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Question(
      question: data['question'] ?? '',
      options: List<String>.from(data['options'] ?? []),
      answerIndex: data['answerIndex'] ?? 0,
    );
  }
}
