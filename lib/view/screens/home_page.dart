import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_slide_transition.dart';

import 'package:movie_quiz/view/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController controller = TextEditingController();
  TextEditingController questionsNumberController = TextEditingController();
  int numberOfTeams = 0;
  int questionsNumber = 0;
  GlobalKey<FormState> formKey = GlobalKey();
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
            Padding(
                padding: const EdgeInsets.all(32.0),
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  labelText: 'هتلعبوا كام تيم ؟!',
                  controller: controller,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  labelText: 'كام سؤال لكل تيم؟!',
                  controller: questionsNumberController,
                )),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    buttonWidth: 0.83,
                    text: "اللي بعده",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        numberOfTeams = int.parse(controller.text);
                        questionsNumber =
                            int.parse(questionsNumberController.text);
                        Navigator.pushReplacement(
                          context,
                          PageTransition(TeamsNamePage(
                            numberOfTeams: numberOfTeams,
                            questionsNumber: questionsNumber,
                          )),
                        );
                      }
                    }),
                
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
