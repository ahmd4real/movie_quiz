

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/models/data_file.dart';
import 'package:movie_quiz/utilities.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';
import 'package:movie_quiz/view/widgets/custom_button.dart';
import 'package:movie_quiz/view/widgets/custom_slide_transition.dart';


// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   TextEditingController controller = TextEditingController();
//   TextEditingController questionsNumberController = TextEditingController();
//   int numberOfTeams = 0;
//   int questionsNumber = 0;
//   GlobalKey<FormState> formKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: Form(
//         key: formKey,
//         child: ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 32.0),
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 width: double.infinity,
//                 child: Image.asset(logoWhite),
//               ),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(32.0),
//                 child: CustomTextField(
//                   keyboardType: TextInputType.number,
//                   labelText: 'هتلعبوا كام تيم ؟!',
//                   controller: controller,
//                 )),
//             Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                 child: CustomTextField(
//                   keyboardType: TextInputType.number,
//                   labelText: 'كام سؤال لكل تيم؟!',
//                   controller: questionsNumberController,
//                 )),
//             const SizedBox(height: 24),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomButton(
//                     buttonWidth: 0.83,
//                     text: "اللي بعده",
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         numberOfTeams = int.parse(controller.text);
//                         questionsNumber =
//                             int.parse(questionsNumberController.text);
//                         Navigator.pushReplacement(
//                           context,
//                           PageTransition(TeamsNamePage(
//                             numberOfTeams: numberOfTeams,
//                             questionsNumber: questionsNumber,
//                           )),
//                         );
//                       }
//                     }),
                
//               ],
//             ),
//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }
// }


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<List<Question>> fetchQuestions() async {
  //   QuerySnapshot snapshot = await _firestore.collection('Questions').get();
  //   print('data length: ${snapshot.docs.length}');
  //  // print('doc id: ${snapshot.docs.map((doc) => doc.id)}');
  //   List<String> docsIds=snapshot.docs.map((doc) => doc.id).toList();
  //   for (int i = 0; i < docsIds.length; i++) {
  //     print('doc id: ${docsIds[i]}');
  //   }
  //   CollectionReference Questions = FirebaseFirestore.instance.collection('Questions');

  //   Map<String, dynamic> data = snapshot.docs[0].data() as Map<String, dynamic>;
    
  //   print('question: ${data['question']}');
  //   return snapshot.docs.map((doc) => Question.fromFirestore(doc)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Demo'),
      ),
      body: FutureBuilder<List<Question>>(
        future: fetchQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //print('data length: ${snapshot.data!.length}');
            return CircularProgressIndicator();
            
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No Questions Found');
          } else {
            List<Question> questions = snapshot.data!;
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(questions[index].question),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: questions[index].options.map((option) => Text(option)).toList(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}


