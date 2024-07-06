import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_text_field.dart';

int i = 0;
List<String> teamNames = [];

class TeamsNamePage extends StatefulWidget {
  const TeamsNamePage({super.key});
  static const String id = "teams_name_page";

  @override
  State<TeamsNamePage> createState() => _TeamsNamePageState();
}

class _TeamsNamePageState extends State<TeamsNamePage> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (i = 0; i < NumebrOfTeams; i++) {
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
    teamNames.clear();
    for (var controller in controllers) {
      teamNames.add(controller.text);
    }
  }

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
              child: Image.asset('assets/images/header.png'),
            ),
          ),
          for (i = 0; i < NumebrOfTeams; i++)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
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
                  Navigator.pushReplacementNamed(context, QuizPage.id);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
