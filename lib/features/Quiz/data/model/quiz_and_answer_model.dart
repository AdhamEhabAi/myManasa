class QuizQuestion {
  final String question;
  final List<QuizAnswer> answers;

  QuizQuestion({required this.question, required this.answers});
}

class QuizAnswer {
  final String text;
  final bool isCorrect;

  QuizAnswer({required this.text, required this.isCorrect});
}
