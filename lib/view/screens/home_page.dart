import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';



int NumebrOfTeams = 0;
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = "home_page";

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
         Padding(
          padding: const EdgeInsets.all(32.0),
          child: TextField(
            onChanged: (value) => NumebrOfTeams = int.parse(value),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Number of teams',
            ),
          ),
        ),

        Padding(
          padding:  const EdgeInsets.all(32.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, TeamsNamePage.id),
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