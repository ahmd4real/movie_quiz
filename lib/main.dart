

import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';

void main () {
    runApp(const MovieQuiz()); 
}

class MovieQuiz extends StatelessWidget {
  const MovieQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      routes: {
        HomePage.id:(context)=> const HomePage(),
        TeamsNamePage.id:(context)=> const TeamsNamePage(),
        QuizPage.id:(context)=> const QuizPage(),
      },
      initialRoute: QuizPage.id,
    );
  }
}