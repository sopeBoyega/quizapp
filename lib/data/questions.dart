import 'package:quizapp/models/quiz_question.dart';


final questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
  QuizQuestion(
    'What does the pubspec.yaml file contain?',
    [
      'All of these',
      'Dependencies',
      'Asset Declarations',
      'Font Declarations',
    ],
  ),
  QuizQuestion(
    'Andriod folder does not contain?',
    [
      'Pod file',
      'Gradle files',
      'Manifest file',
      'Android app folder',
    ],
  ),
  QuizQuestion(
    'MaterialPageRoute is?',
    [
      'To change a whole page',
      'To define route',
      'To naviagte between pages',
      'To control the routes',
    ],
  ),
  QuizQuestion(
    'Which of the following are reasons for an asynchronous computation?',
    [
      'Weather data from an API',
      'Printing a statement',
      'Addition of two numbers',
      'Data type conversion',
    ],
  ),
];