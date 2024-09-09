class PdfModel {
  final String id;
  final String name;
  final String url;
  final String date;
  final String owner;
  final String idClassroom;

  PdfModel({
    required this.id,
    required this.name,
    required this.url,
    required this.date,
    required this.owner,
    required this.idClassroom,
  });

  // Factory method to create an instance from JSON
  factory PdfModel.fromJson(Map<String, dynamic> json) {
    return PdfModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      date: json['date'] ?? '',
      owner: json['owner'] ?? '',
      idClassroom: json['idclassroom'] ?? '',
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'date': date,
      'owner': owner,
      'idclassroom': idClassroom,
    };
  }
}
