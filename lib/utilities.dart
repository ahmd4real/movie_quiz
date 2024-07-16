import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_quiz/models/data_file.dart';

Future<List<Question>> fetchQuestions() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot snapshot = await firestore.collection('Questions').get();
  List<String> docsIds = snapshot.docs.map((doc) => doc.id).toList();

  CollectionReference Questions = FirebaseFirestore.instance.collection('Questions');

  Map<String, dynamic> data = snapshot.docs[0].data() as Map<String, dynamic>;

  print(docsIds);
  return snapshot.docs.map((doc) => Question.fromFirestore(doc)).toList();
}
