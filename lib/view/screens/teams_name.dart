import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_slide_transition.dart';

import 'package:movie_quiz/view/widgets/custom_text_field.dart';

class TeamsNamePage extends StatefulWidget {
  const TeamsNamePage(
      {super.key, required this.numberOfTeams, required this.questionsNumber});
  final int numberOfTeams;
  final int questionsNumber;
  @override
  State<TeamsNamePage> createState() => _TeamsNamePageState();
}

class _TeamsNamePageState extends State<TeamsNamePage> {
  List<TextEditingController> controllers = [];
  GlobalKey<FormState> formKey = GlobalKey();
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

    Navigator.pushReplacement(
        context,
        PageTransition(QuizPage(
          teamNames: teamNames,
          questionsNumber: widget.questionsNumber,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.asset(logoWhite),
              ),
            ),
            for (int i = 0; i < widget.numberOfTeams; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: CustomTextField(
                  errorMsg: 'الاسم ياااا',
                  labelText: "فريق ${i + 1}",
                  controller: controllers[i],
                ),
              ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonWidth: 0.83,
                  text: "اللي بعده",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      saveTeamNames();
                    }
                  },
                )
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
