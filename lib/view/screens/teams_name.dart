import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';



int i=0;
List<String> names = [];
class TeamsNamePage extends StatelessWidget {
  const TeamsNamePage({super.key});
  static const String id = "teams_name_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          padding:  const EdgeInsets.all(32.0),
          child: TextField(
            onSubmitted: (value) => names.add(value),
            //keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Team $i',
            ),
          ),
        ),

        Padding(
          padding:  const EdgeInsets.all(32.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, QuizPage.id),
            style: ElevatedButton.styleFrom(
              foregroundColor: kWhite, backgroundColor: kGrey,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),  
          )
        ), child: const Text("Start",style: TextStyle(color: kWhite,fontSize: 30),),))
       ],
        
      ),
    );
  }
}