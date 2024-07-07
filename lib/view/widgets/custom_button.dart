import 'package:flutter/material.dart';
import 'package:movie_quiz/constants.dart';
import 'package:movie_quiz/view/screens/home_page.dart';
import 'package:movie_quiz/view/screens/teams_name.dart';

class CustomButton extends StatelessWidget {
 
  String text;
  Color color;
  Function()? onTap;
  CustomButton({super.key, required this.color, this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.all(6.0),
                width: MediaQuery.of(context).size.width * 0.83,
                decoration: 
                BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: color),
                ),
                child: ElevatedButton(
                  
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all(0),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      color,)
                  ),
                    onPressed: onTap,
                    child:  Text(
                     text,
                      style: const TextStyle(
                        color: kWhite,
                          fontFamily: font,
                          fontWeight: FontWeight.w700,
                          fontSize: 32),
                    )),
              );
            
;
  }
}