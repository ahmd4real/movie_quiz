import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/main.dart';
import 'package:movie_quiz/view/screens/add_questions_page.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_image_button.dart';
import 'package:movie_quiz/view/widgets/custom_slide_transition.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.teamNames,
      required this.score,
      required this.questionsNumber});
  final List<String> teamNames;
  final List<int> score;
  final int questionsNumber;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    Map<String, int> scoreMap = {};

    for (int i = 0; i < teamNames.length; i++) {
      scoreMap[teamNames[i]] = score[i];
    }
    // to sort the map in descending order according to score
    var sortedMap = scoreMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Scaffold(
     
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top:24,
          left: 16,
          right: 16, 

        ),
        child: ListView(
          children: [
           for (int i = 0; i < teamNames.length; i++)
            BounceInUp(
              delay: Duration(milliseconds: 100 * i),
              child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.only(bottom: w / 20),
                    height: w / 4.5,
                    decoration: BoxDecoration(
                      color: kDarkPurple,
                      border: Border.all(color: Colors.white30, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: ListTile(
                        title: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height / 4.5,
                            maxWidth: MediaQuery.of(context).size.width / 3,
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              
                              sortedMap[i].key,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                  fontFamily: font,
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        trailing: Text(
                          '$questionsNumber/${sortedMap[i].value}',
                          style: const TextStyle(
                              fontFamily: font,
                              color: Colors.white70,
                              fontSize: 32,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
            ),
            Column(
              children: [
                
                const SizedBox(height: 16), 
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomImageButton(
                  img: buttonImg,
                  color:Colors.white10,// const Color.fromARGB(8, 255, 255, 255),
                  radiusRatio: .2,
                  ontap: () {
                    if (indexToStartFrom==docsIds.length-1){
                      indexToStartFrom=0;
                      docsIds.shuffle();
                    }
                    print('Index we start from : $indexToStartFrom');
                    Navigator.pushReplacement(
                        context, PageTransition(HomePage()));
                  },
                  shadowColor: kDarkPurple,
                  borderColor: Colors.white24,
                )),
                CustomButton(
                   color1: kPink,
                  color2: kDarkPurple,
                  borderColor: Colors.white54,
                    //buttonWidth: 0.83,
                    text: " عاوز تضيف سؤال؟؟!",
                    onTap: () {
                      Navigator.push(context, PageTransition(const AddQuestionsPage()));
                    }),
                    
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
