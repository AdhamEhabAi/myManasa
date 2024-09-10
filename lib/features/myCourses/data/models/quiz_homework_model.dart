import 'package:intl/intl.dart';

class QuizHomeworkModel {
  final String id;
  final String name;
  final String idquiz;
  final String idclassroom;
  final String leader;
  final String status;
  final DateTime date;
  final String stylePage;
  final String limitedVideo;

  QuizHomeworkModel({
    required this.id,
    required this.name,
    required this.idquiz,
    required this.idclassroom,
    required this.leader,
    required this.status,
    required this.date,
    required this.stylePage,
    required this.limitedVideo,
  });

  factory QuizHomeworkModel.fromJson(Map<String, dynamic> json) {
    return QuizHomeworkModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      idquiz: json['idquiz'] ?? '',
      idclassroom: json['idclassroom'] ?? '',
      leader: json['leader'] ?? '',
      status: json['status'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
      stylePage: json['stylePage'] ?? '',
      limitedVideo: json['limtedvideo'] ?? '',
    );
  }

  String get formattedDate {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}
