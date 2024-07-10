import 'package:movie_quiz/models/data_file.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';

void resetValues() {
  teamIndex = 0;
  teamQuestionCount = List.filled(numberOfTeams, 0);
  score = List.filled(numberOfTeams, 0);
  questionOrder = List.generate(data.length, (index) => index); // Generate a list of indices for the questions
  questionOrder.shuffle(); // Shuffle the questions order

  currentQuestion = questionOrder[0];
  totalQuestionsAsked = 0;
  quizStarted = false;
}
