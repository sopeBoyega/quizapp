class QuizQuestion {
  QuizQuestion(this.text, this.answers) {
    // Shuffle answers once when the question is created
    _shuffledAnswers = List.of(answers);
    _shuffledAnswers.shuffle();
  }

  final String text;
  final List<String> answers;
  late final List<String> _shuffledAnswers;

  List<String> get shuffledAnswers => _shuffledAnswers;
}
