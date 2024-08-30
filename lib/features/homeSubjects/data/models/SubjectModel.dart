class SubjectModel {
  final String id;
  final String name;
  final String logo;
  final String? bigImg;

  SubjectModel({
    required this.id,
    required this.name,
    required this.logo,
    this.bigImg,
  });

  // Factory constructor to create a SubjectModel from a JSON object
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      bigImg: json['BigImg'] as String?,
    );
  }

  // Method to convert a SubjectModel to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'BigImg': bigImg,
    };
  }
}
