import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/models/question_model.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';

//this function is used to fetch the indexes or docIds of the questions
//store in list so we can shuffle it later
Future<List<String>> fetchIndexes() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot snapshot = await firestore.collection('Questions').get();
  List<String> docsIds = snapshot.docs.map((doc) => doc.id).toList();
  return docsIds;
}

//This funtsion is used to fetch or prepare the questions,which it takes
//number of questions that teams entered,and list of docIds to use as index for the questions
//stored in database and return a list of questions

Future<List<Question>> fetchQuestions(
    int numberOfQuestions, List<String> docsIds) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Question> questions = [];
  if (indexToStartFrom == docsIds.length) {
    indexToStartFrom = 0;
  }
  // Fetch the questions from Firestore
  for (int i = indexToStartFrom;
      i < numberOfQuestions + indexToStartFrom;
      i++) {
    DocumentSnapshot snapshot =
        await firestore.collection('Questions').doc(docsIds[i + 1]).get();
    questions.add(Question.fromFirestore(snapshot));
  }

  return questions;
}

Future<int> getDocumentCount(String collectionName) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection(collectionName).get();
  return snapshot.docs.length;
}

int lastQuestionId = 0;

//add questions to firestore
Future<bool> addQuestions(
    {required String question,
    required List<String> options,
    required int answerIndex}) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  lastQuestionId = await getDocumentCount('Questions');

  try {
    await firestore
        .collection('Questions')
        .doc((lastQuestionId + 1).toString())
        .set({
      "question": question,
      "options": options,
      "answerIndex": answerIndex - 1
    });
    return true;
  } catch (error) {
    return false;
  }
}

Future<bool> showAlertDialog(
    BuildContext context, String question, String answer) async {
  bool sure = false;
  sure = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kBackgroundColor,
        content: Text(
          "متأكد ان " "$answer" " هو الاجابة الصحيحة؟",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: kYellow,
            fontFamily: font,
          ),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(true); // Return true when "ايوه" is pressed
                },
                child: const Text('ايوه',
                    style: TextStyle(
                        fontSize: 12, color: kYellow, fontFamily: font)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(false); // Return false when "لا يعم" is pressed
                },
                child: const Text('لا يعم',
                    style: TextStyle(
                        fontSize: 12, color: kYellow, fontFamily: font)),
              ),
            ],
          ),
        ],
      );
    },
  );
  return sure ?? false;
}

void showAutoDismissDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop(true);
      });

      return const AlertDialog(
          backgroundColor: kBackgroundColor,
          content: Text(
            "ابيض يا دولي ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                color: kYellow,
                fontFamily: font,
                fontWeight: FontWeight.bold),
          ));
    },
  );
}
