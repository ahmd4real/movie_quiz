import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/widgets/custom_image_button.dart';
import 'package:movie_quiz/view/widgets/custom_slide_transition.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.teamNames, required this.score});
  static const String id = "results_page";
  final List<String> teamNames;
  final List<int> score;

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: AnimationLimiter(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(w / 30),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: teamNames.length,
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
                              color: kQuiestionColor,
                              border: Border.all(color: kYellow, width: 3),
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
                                    maxHeight:
                                        MediaQuery.of(context).size.height /
                                            4.5,
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 3,
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      sortedMap[i].key,
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                          fontFamily: font,
                                          color: kYellow,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                                trailing: Text(
                                  '${sortedMap[i].value}/10',
                                  style: const TextStyle(
                                      fontFamily: font,
                                      color: kYellow,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900),
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
                  child: CustomImageButton(
                    img: buttonImg,
                    color: kYellow,
                    radiusRatio: .2,
                    ontap: () {
                      Navigator.pushReplacement(
                          context, PageTransition(HomePage()));
                    },
                    shadowColor: Colors.black87,
                    borderColor: const Color.fromARGB(255, 0, 0, 0),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
