import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.answerText, required this.onTap,});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap,style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 36, 1, 95),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    ), child:  Text(answerText,textAlign: TextAlign.center,));
  }
}
