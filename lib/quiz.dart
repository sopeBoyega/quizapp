import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';

import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});


   @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
 List<String> selectedAnswers = [];

var activeScreen = "start-screen";


void chooseAnswer(String answer) {
 selectedAnswers.add(answer);

 if (selectedAnswers.length == questions.length) {
   setState(() {
    activeScreen = "result-screen";
   });
 }
}

// Available in Stateful Widgets
void switchScreen() {
  // When Setstate is called Flutter re-executes the build method and rusn the code in it again
  // If they are any diffrences , it updates the UI
  setState(() {
    if (activeScreen == "start-screen") {
       activeScreen = "questions-screen" ;
    }
    else  if (activeScreen == "result-screen") {
      activeScreen = "start-screen";
    }

  });
}

@override
  Widget build(BuildContext context) {

    Widget screenWidget = StartScreen(switchScreen);

    if ( activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if ( activeScreen == 'result-screen') {
      screenWidget = ResultScreen(switchScreen,chosenAnswers: selectedAnswers);
    }

    if (activeScreen == 'start-screen') {
      selectedAnswers = [];
    screenWidget = StartScreen(switchScreen);
    }


   return 
       Scaffold(
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
            child: screenWidget,
          ),
        ),
      );
  }
}