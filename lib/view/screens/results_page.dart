import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/utilities.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/quiz_page.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});
  static const String id = "results_page";
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: AnimationLimiter(
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(w / 30),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: numberOfTeams,
                itemBuilder: (BuildContext c, int i) {
                  return AnimationConfiguration.staggeredList(
                    position: i,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: 30,
                      verticalOffset: 300.0,
                      child: FlipAnimation(
                        duration: const Duration(milliseconds: 3000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        flipAxis: FlipAxis.y,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: EdgeInsets.only(bottom: w / 20),
                          height: w / 4.5,
                          decoration: BoxDecoration(
                            border: Border.all(color: kYellow2),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                teamNames[i],
                                style: const TextStyle(
                                    fontFamily: teamFont,
                                    color: kYellow2,
                                    fontSize: 32),
                              ),
                              trailing: Text(
                                '${score[i]} / 10',
                                style: const TextStyle(
                                    fontFamily: teamFont,
                                    color: kYellow2,
                                    fontSize: 32),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kGreen2, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Material(
                  shape: const CircleBorder(),
                  child: InkWell(
                    splashColor: Colors.black,
                    onTap: () {
                      resetValues();
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    customBorder: const CircleBorder(),
                    child: Ink(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: kYellow2,
                        backgroundImage: const AssetImage(buttonImg),
                        radius: MediaQuery.of(context).size.width * 0.18,
                      ),
                    ),
                  ),
                ),
              ),),
            //Padding(
              
              // padding: const EdgeInsets.all(8.0),
              // child: Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: kGreen2, width: 2),
              //     shape: BoxShape.circle,
              //   ),
              //   child: Material(
              //     shape: const CircleBorder(),
              //     child: InkWell(
              //       splashColor: Colors.black,
              //       onTap: () {
              //         resetValues();
              //         Navigator.pushNamed(context, HomePage.id);
              //       },
              //       customBorder: const CircleBorder(),
              //       child: Ink(
              //         decoration: const BoxDecoration(shape: BoxShape.circle),
              //         child: CircleAvatar(
              //           backgroundColor: kYellow2,
              //           backgroundImage: const AssetImage(buttonImg),
              //           radius: MediaQuery.of(context).size.width * 0.18,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            //),
          ],
        ),
      ),
    );
  }
}
