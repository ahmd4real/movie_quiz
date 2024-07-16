import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/models/data_file.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});
  CollectionReference questions =
      FirebaseFirestore.instance.collection('Questions');
      FirebaseFirestore firestore = FirebaseFirestore.instance;
  void addQuestions(List<Question> numbers) {
    int index = 0;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (index < data.length) {
        firestore.collection('Questions').doc((index+2).toString()).set({
          "question": data[index].question,
              "options": data[index].options,
              "answerIndex": data[index].answerIndex}
        ) .then((value) => print("Question Added"))
            .catchError((error) => print("Failed to add question: $error"));

        ;
        // questions
        //     .add({
        //       "id":index+1,
        //       "question": data[index].question,
        //       "options": data[index].options,
        //       "answerIndex": data[index].answerIndex
        //     })
        //     .then((value) => print("Question Added"))
        //     .catchError((error) => print("Failed to add question: $error"));

        index++;
      } else {
        timer.cancel();
      }
    });
  }


  void readData(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(onPressed:(){
                //addQuestions(data);
              }, child: Text("ADD"))),
          Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(onPressed: () {



              }, child: Text("Read")))
        ],
      )),
    );
  }
}


// class GetUserName extends StatelessWidget {
//   final String documentId;

//   GetUserName(this.documentId);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference Questions = FirebaseFirestore.instance.collection('Questions');

//     return FutureBuilder<DocumentSnapshot>(
//       future: Questions.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return Text("Question: ${data['question']} ${data['options']} ${data['answerIndex']}");
//         }

//         return Text("loading");
//       },
//     );
//   }
// }