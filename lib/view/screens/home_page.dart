import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/results_page.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_text_field.dart';

int NumebrOfTeams = 0;

class HomePage extends StatelessWidget {
   HomePage({super.key});
  static const String id = "home_page";
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(appTitle,style: TextStyle(fontFamily:  teamFont,color: kYellow2)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.asset('assets/images/header.png'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(32.0),
              child: CustomTextField(
                keyboardType: TextInputType.number,
                labelText: 'هتلعبوا كام تيم ؟!', controller: controller,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    
              CustomButton(color: kMove, text: "اللي بعده", onTap: () {
                NumebrOfTeams = int.parse(controller.text);
                     Navigator.pushReplacementNamed(context, TeamsNamePage.id);
              })
             
            
            ],
          )
        ],
      ),
    );
  }
}
