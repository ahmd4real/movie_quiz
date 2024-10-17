import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/main.dart';
import 'package:movie_quiz/utilities.dart';
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
    loadIds();
    for (int i = 0; i < widget.numberOfTeams; i++) {
      controllers.add(TextEditingController());
    }
    super.initState();
    
  }

  Future<void> loadIds() async {
    if (docsIds.isEmpty ){
    docsIds = await fetchIndexes();
  docsIds.shuffle();
    }else {
      print('**********\nids already loaded\n**********');
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
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
                //width: double.infinity,
                child: Image.asset(logo),
              ),
              const SizedBox(height: 64),
              for (int i = 0; i < widget.numberOfTeams; i++)
                BounceInUp(delay: Duration(milliseconds: 100 * i),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      errorMsg: 'الاسم ياااا',
                      labelText: "فريق ${i + 1}",
                      controller: controllers[i],
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              CustomButton(
               color1: kDarkPurple,
                    color2: kPurple,
                text: "اللي بعده",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    saveTeamNames();
                    
                    print('Docs ids: $docsIds');
                  }
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
