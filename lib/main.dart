import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_quiz/firebase_options.dart';
import 'package:movie_quiz/utilities.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
List<String> docsIds = [];
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );

  
  runApp(const MovieQuiz());
  docsIds = await fetchIndexes();
  docsIds.shuffle();
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
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      home: SafeArea(child: HomePage()),
      
    );
  }
}
