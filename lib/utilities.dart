import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_quiz/models/data_file.dart';


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
Future<List<Question>> fetchQuestions(int numberOfQuestions, List<String> docsIds) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Question> questions = [];

  // Fetch the questions from Firestore
  for (int i = 0; i < numberOfQuestions; i++) {
    DocumentSnapshot snapshot = await firestore.collection('Questions').doc(docsIds[i]).get();
    questions.add(Question.fromFirestore(snapshot));
    //print('Question added: ${snapshot.data()}');
    print('Question added: ${questions[i].question}');
  }

  return questions;
}

