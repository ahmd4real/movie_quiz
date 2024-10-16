import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/utilities.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_text_field.dart';

class AddQuestionsPage extends StatefulWidget {
  const AddQuestionsPage({super.key});

  @override
  _AddQuestionsPageState createState() => _AddQuestionsPageState();
}

class _AddQuestionsPageState extends State<AddQuestionsPage> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController answerController = TextEditingController();

  List<TextEditingController> controllers = [];

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: kYellow),
      ),
      backgroundColor: kBackgroundColor,
      body: ModalProgressHUD(
        color: kBackgroundColor.withOpacity(0.3),
        progressIndicator: const SpinKitCircle(
          color: kYellow,
          size: 120.0,
        ),
        inAsyncCall: isLoading,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: const Text(
                              "هتضيف هنا 3 افلام منهم الفيلم اللي جه فيه الجملة او الافيه ",
                              style: TextStyle(
                                  color: kYellow,
                                  fontFamily: font,
                                  fontSize: 18),
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
                                  color: kYellow,
                                  fontFamily: font,
                                  fontSize: 18),
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^[1-3]$')),
                      ],
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
                    color1: kPink,
                    color2: kDarkPurple,
                    text: "ودددي",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final sure = await showAlertDialog(context,
                            questionController.text, answerController.text);

                        if (sure) {
                          setState(() {
                            isLoading = true;
                          });

                          final successed = await addQuestions(
                            question: questionController.text,
                            options: [
                              option1Controller.text,
                              option2Controller.text,
                              option3Controller.text
                            ],
                            answerIndex: int.parse(answerController.text),
                          );

                          setState(() {
                            isLoading = false;
                          });

                          if (successed) {
                            showAutoDismissDialog(context);
                            questionController.clear();
                            option1Controller.clear();
                            option2Controller.clear();
                            option3Controller.clear();
                            answerController.clear();
                          } else {}
                        }
                      }
                    },
                  )
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
