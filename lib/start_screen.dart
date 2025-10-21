import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz,{
    super.key,
  });


  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 80),
          Text(
            "Learn flutter the fun way!",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
