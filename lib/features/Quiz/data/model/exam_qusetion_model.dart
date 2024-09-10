class ExamQuestion {
  final String id;
  final String question;
  final List<String> answers;
  final String correctAnswer;

  ExamQuestion({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory ExamQuestion.fromJson(Map<String, dynamic> json) {
    return ExamQuestion(
      id: json['id'] as String,
      question: json['question'] as String,
      answers: [
        json['answer1'] as String,
        json['answer2'] as String,
        json['answer3'] as String,
        json['answer4'] as String,
      ],
      correctAnswer: json['trueanswer'] as String,
    );
  }
}
