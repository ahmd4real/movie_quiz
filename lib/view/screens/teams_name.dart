import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_text_field.dart';



class TeamsNamePage extends StatefulWidget {
  TeamsNamePage({super.key, required this.numberOfTeams});
  static const String id = "teams_name_page";
  
  final int numberOfTeams;

  @override
  State<TeamsNamePage> createState() => _TeamsNamePageState();
}

class _TeamsNamePageState extends State<TeamsNamePage> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numberOfTeams; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void saveTeamNames() {
    List<String> teamNames = [];
    for (var controller in controllers) {
      teamNames.add(controller.text);
    }
    // Pass teamNames to the next screen or use them as needed
    Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context) =>  QuizPage(teamNames: teamNames,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Image.asset(logoWhite),
            ),
          ),
          for (int i = 0; i < widget.numberOfTeams; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: CustomTextField(
                labelText: "فريق ${i + 1}",
                controller: controllers[i],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                color: kMove,
                text: "اللي بعده",
                onTap: () {
                  saveTeamNames();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
