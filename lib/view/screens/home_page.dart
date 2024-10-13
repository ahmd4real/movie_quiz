import 'package:animate_do/animate_do.dart';
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
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: Image.asset(logoWhite),
              ),
              BounceInLeft(
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  labelText: 'هتلعبوا كام تيم ؟!',
                  controller: controller,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BounceInLeft(
                delay: const Duration(milliseconds: 500),
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  labelText: 'كام سؤال لكل تيم؟!',
                  controller: questionsNumberController,
                ),
              ),
              const SizedBox(height: 24),
              BounceInLeft(
                delay: const Duration(milliseconds: 750),
                child: CustomButton(
                    color1: kPink,
                    color2: kDarkPurple,
                    text: "اللي بعده",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        numberOfTeams = int.parse(controller.text);
                        questionsNumber =
                            int.parse(questionsNumberController.text);
                        Navigator.push(
                          context,
                          PageTransition(TeamsNamePage(
                            numberOfTeams: numberOfTeams,
                            questionsNumber: questionsNumber,
                          )),
                        );
                      }
                    }),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
