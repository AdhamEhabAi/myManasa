class ExamHistory {
  final String id;
  final String name;
  final String idQuiz;
  final String idClassroom;
  final String leader;
  final String status;
  final String date;
  final String stylePage;
  final String limitedVideo;
  final String report;
  final UserScore userScore;

  ExamHistory({
    required this.id,
    required this.name,
    required this.idQuiz,
    required this.idClassroom,
    required this.leader,
    required this.status,
    required this.date,
    required this.stylePage,
    required this.limitedVideo,
    required this.report,
    required this.userScore,
  });

  factory ExamHistory.fromJson(Map<String, dynamic> json) {
    return ExamHistory(
      id: json['id'] as String,
      name: json['name'] as String,
      idQuiz: json['idquiz'] as String,
      idClassroom: json['idclassroom'] as String,
      leader: json['leader'] as String,
      status: json['status'] as String,
      date: json['date'] as String,
      stylePage: json['stylePage'] as String,
      limitedVideo: json['limtedvideo'] as String,
      report: json['report'] as String,
      userScore: UserScore.fromJson(json['10'] as Map<String, dynamic>),
    );
  }
}
class UserScore {
  final String id;
  final String idUser;
  final String idQuiz;
  final String score;
  final String percentage;
  final String correctAnswers;

  UserScore({
    required this.id,
    required this.idUser,
    required this.idQuiz,
    required this.score,
    required this.percentage,
    required this.correctAnswers,
  });

  factory UserScore.fromJson(Map<String, dynamic> json) {
    return UserScore(
      id: json['id'] as String,
      idUser: json['iduser'] as String,
      idQuiz: json['idquiz'] as String,
      score: json['score'] as String,
      percentage: json['nesba'] as String,
      correctAnswers: json['quintanser'] as String,
    );
  }
}
