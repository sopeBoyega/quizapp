import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';

import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});


   @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
var activeScreen = "start-screen";






// Available in Stateful Widgets
void switchScreen() {
  // When Setstate is called Flutter re-executes the build method and rusn the code in it again
  // If they are any diffrences , it updates the UI
  setState(() {
    activeScreen = "questions-screen" ;
  });
}

@override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 63, 5, 120),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: activeScreen == "start-screen" ? StartScreen(switchScreen) : QuestionsScreen(),
          ),
        ),
      ),
    );
  }
}