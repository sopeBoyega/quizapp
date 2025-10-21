import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/answer_button.dart';
import 'dart:async';

import 'package:quizapp/data/questions.dart';

// Separate widget for answers to prevent unnecessary rebuilds
class QuestionAnswers extends StatelessWidget {
  const QuestionAnswers({
    super.key,
    required this.question,
    required this.onAnswerSelected,
  });

  final dynamic question;
  final Function(String) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    // Create a static key based on the question text to maintain same shuffle
    final key = ValueKey(question.text);
    
    return Column(
      key: key, // Add key to maintain state
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.from(question.shuffledAnswers).map<Widget>((answer) {
        return AnswerButton(
          key: ValueKey(answer), // Add key to maintain button state
          answerText: answer,
          onTap: () => onAnswerSelected(answer),
        );
      }).toList(),
    );
  }
}

// Main screen widget

class QuestionsScreen extends StatefulWidget {
  // Code below is a constructor , saying that that any time you what to create an object of this class
  // You need to pass the named function argument  onSelectAnswer which is a function tat executes when an answer is selected
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsState();
}


class _QuestionsState extends State<QuestionsScreen> {
  late final PageController _pageController;
  int _currentPage = 0;
  bool _isAnimating = false;
  late Timer _timer;
  int _timeLeft = 15; 

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timeLeft = 15;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer.cancel();
        if (_currentPage < questions.length - 1) {
          _answerQuestion(''); 
          _startTimer();
        }
      }
    });
  }

  void _resetTimer() {
    _timer.cancel();
    _startTimer();
  }

  void _answerQuestion(String selectedAnswer) async {
    if (_isAnimating) return;
    widget.onSelectAnswer(selectedAnswer);
    if (_currentPage < questions.length - 1) {
      setState(() {
        _isAnimating = true;
      });
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
        _isAnimating = false;
      });
    }
    // If last question, let parent handle navigation to result screen
  }


  void _goToPreviousQuestion() async {
    if (_currentPage > 0 && !_isAnimating) {
      setState(() {
        _isAnimating = true;
      });
      await _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--;
        _isAnimating = false;
      });
      _resetTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Column(
                      key: ValueKey(question.text),
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentPage > 0)
                              IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: _goToPreviousQuestion,
                              )
                            else
                              const SizedBox(width: 48),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 202, 138, 237),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Time left: $_timeLeft s',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 48),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          question.text,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 202, 138, 237),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        QuestionAnswers(
                          question: question,
                          onAnswerSelected: (answer) {
                            _answerQuestion(answer);
                            _resetTimer();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
