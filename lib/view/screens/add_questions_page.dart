import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/utilities.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_text_field.dart';

class AddQuestionsPage extends StatelessWidget {
  AddQuestionsPage({super.key});
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController answerController = TextEditingController();
  
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
      backgroundColor: kBackgroundColor,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Column(
                children: [
                  CustomTextField(
                    errorMsg: 'الافيه ياااا',
                    labelText: "الجملة او الافيه اللي اتقال في الفيلم",
                    controller: questionController,
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: kYellow,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: const Text(
                            "هتضيف هنا 3 افلام منهم الفيلم اللي جه فيه الجملة او الافيه ",
                            style: TextStyle(
                                color: kYellow, fontFamily: font, fontSize: 18),
                            textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: kYellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    errorMsg: 'الفيلم ياااا',
                    labelText: "الفيلم الاول",
                    controller: option1Controller,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    errorMsg: 'الفيلم ياااا',
                    labelText: "الفيلم الثاني",
                    controller: option2Controller,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    errorMsg: 'الفيلم ياااا',
                    labelText: "الفيلم الثالث",
                    controller: option3Controller,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: kYellow,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("اكتب رقم الاجابة الصح",
                            style: TextStyle(
                                color: kYellow, fontFamily: font, fontSize: 18),
                            textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: kYellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    errorMsg: "😒1 او 2 او 3",
                    labelText: "1 او 2 او 3",
                    controller: answerController,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonWidth: 0.83,
                  text: "ودي",
                  onTap: () {
                   //printDocumentById('176');
                    if (formKey.currentState!.validate()) {
                      addQuestions(
                        question: questionController.text,
                        options: [
                          option1Controller.text,
                          option2Controller.text,
                          option3Controller.text
                        ],
                        answerIndex: int.parse(answerController.text),
                      );
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
