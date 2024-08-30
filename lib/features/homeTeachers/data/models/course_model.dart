class CourseModel {
  final String id;
  final String name;
  final String typeClassroom;
  final String videoControl;
  final String cat;
  final String? title;
  final String? img;
  final String? vid;
  final String vstatus;
  final String? stitle;
  final String? svid;
  final String sstatus;
  final String videoLimit;
  final String sub;
  final String pub;
  final String yr;
  final String price;
  final String exam;
  final String fres;
  final String cnct;
  final String exmlnk;

  CourseModel({
    required this.id,
    required this.name,
    required this.typeClassroom,
    required this.videoControl,
    required this.cat,
    this.title,
    this.img,
    this.vid,
    required this.vstatus,
    this.stitle,
    this.svid,
    required this.sstatus,
    required this.videoLimit,
    required this.sub,
    required this.pub,
    required this.yr,
    required this.price,
    required this.exam,
    required this.fres,
    required this.cnct,
    required this.exmlnk,
  });

  // Factory method to create a Classroom instance from a JSON map
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      typeClassroom: json['typeclassroom'] ?? '',
      videoControl: json['videoControll'] ?? '',
      cat: json['cat'] ?? '',
      title: json['title'],
      img: json['img'] ?? '',
      vid: json['vid'],
      vstatus: json['vstatus'] ?? '',
      stitle: json['stitle'],
      svid: json['svid'],
      sstatus: json['sstatus'] ?? '',
      videoLimit: json['videolimte'] ?? '',
      sub: json['sub'] ?? '',
      pub: json['pub'] ?? '',
      yr: json['yr'] ?? '',
      price: json['price'] ?? '',
      exam: json['exam'] ?? '',
      fres: json['fres'] ?? '',
      cnct: json['cnct'] ?? '',
      exmlnk: json['exmlnk'] ?? '',
    );
  }

  // Method to convert a Classroom instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'typeclassroom': typeClassroom,
      'videoControll': videoControl,
      'cat': cat,
      'title': title,
      'img': img,
      'vid': vid,
      'vstatus': vstatus,
      'stitle': stitle,
      'svid': svid,
      'sstatus': sstatus,
      'videolimte': videoLimit,
      'sub': sub,
      'pub': pub,
      'yr': yr,
      'price': price,
      'exam': exam,
      'fres': fres,
      'cnct': cnct,
      'exmlnk': exmlnk,
    };
  }
}
