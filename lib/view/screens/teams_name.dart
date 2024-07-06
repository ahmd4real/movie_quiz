import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';
import 'package:movie_quiz/view/widgets/custom_text_field.dart';



int i=0;
List<String> names = [];
class TeamsNamePage extends StatelessWidget {
  const TeamsNamePage({super.key});
  static const String id = "teams_name_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text("Movie Quiz"),
      ),
      body: ListView(
       children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child:Image.asset('assets/images/header.png'),
          ),
        )
        ,
        for (i=0;i<NumebrOfTeams;i++)
         Padding(
          padding:  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
          child: CustomTextField(labelText: "فريق ${i+1}"),
        ),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    kAnswerColor,)
                ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, QuizPage.id);
                  },
                  child: const Text(
                    "اللي بعده",
                    style: TextStyle(
                      color: kWhite,
                        fontFamily: font,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  )),
            
            ],
          )
       ],
        
      ),
    );
  }
}