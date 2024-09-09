class VideoModel {
  final String id;
  final String name;
  final String idClassroom;
  final String leader;
  final DateTime date;
  final String videoType;
  final int views;
  final String firstUrl;
  final String? secondUrl;
  final String status;
  final String? dis;

  VideoModel({
    required this.id,
    required this.name,
    required this.idClassroom,
    required this.leader,
    required this.date,
    required this.videoType,
    required this.views,
    required this.firstUrl,
    required this.dis,
    this.secondUrl,
    required this.status,
  });

  // Factory constructor to create a VideoModel from JSON
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      name: json['name'],
      idClassroom: json['idclassroom'],
      leader: json['leader'],
      date: DateTime.parse(json['date']),
      videoType: json['videoType'],
      views: int.parse(json['views']),
      firstUrl: json['firstUrl'],
      secondUrl: json['sacandUrl'],
      status: json['status'],
      dis: json['dis'] ?? '',
    );
  }

  // Method to convert a VideoModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'idclassroom': idClassroom,
      'leader': leader,
      'date': date.toIso8601String(),
      'videoType': videoType,
      'views': views.toString(),
      'firstUrl': firstUrl,
      'sacandUrl': secondUrl,
      'status': status,
    };
  }
}
