class Teacher {
  final String id;
  final String filterTeatcher;
  final String fname;
  final String lname;
  final String fnum;
  final String lnum;
  final String yr;
  final String sec;
  final String email;
  final String uname;
  final String img;
  final String upass;
  final String rank;
  final String active;
  final String rnk;
  final String? macu;
  final String otname;
  final String? bio;

  Teacher({
    required this.id,
    required this.filterTeatcher,
    required this.fname,
    required this.lname,
    required this.fnum,
    required this.lnum,
    required this.yr,
    required this.sec,
    required this.email,
    required this.uname,
    required this.img,
    required this.upass,
    required this.rank,
    required this.active,
    required this.rnk,
    this.macu,
    required this.otname,
    this.bio,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'] as String,
      filterTeatcher: json['filterTeatcher'] as String,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      fnum: json['fnum'] as String,
      lnum: json['lnum'] as String,
      yr: json['yr'] as String,
      sec: json['sec'] as String,
      email: json['email'] as String,
      uname: json['uname'] as String,
      img: json['img'] as String,
      upass: json['upass'] as String,
      rank: json['rank'] as String,
      active: json['active'] as String,
      rnk: json['rnk'] as String,
      macu: json['macu'] as String?,
      otname: json['otname'] as String,
      bio: json['bio'] as String?,
    );
  }
}
