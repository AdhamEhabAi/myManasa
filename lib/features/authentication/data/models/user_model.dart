class UserModel {
  final String id;
  final String fname;
  final String lname;
  final String img;
  final String fnum;
  final String filterTeatcher;
  final String lnum;
  final String country;
  final String uname;
  final String upass;
  final String yr;
  final String rank;
  final String active;
  final String rnk;

  UserModel({
    required this.id,
    required this.fname,
    required this.lname,
    required this.img,
    required this.fnum,
    required this.filterTeatcher,
    required this.lnum,
    required this.country,
    required this.uname,
    required this.upass,
    required this.yr,
    required this.rank,
    required this.active,
    required this.rnk,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'] ?? '',
      fname: jsonData['fname'] ?? '',
      lname: jsonData['lname'] ?? '',
      img: jsonData['img'] ?? '',
      fnum: jsonData['fnum'] ?? '',
      filterTeatcher: jsonData['filterTeatcher'] ?? '',
      lnum: jsonData['lnum'] ?? '',
      country: jsonData['country'] ?? '',
      uname: jsonData['uname'] ?? '',
      upass: jsonData['upass'] ?? '',
      yr: jsonData['yr'] ?? '',
      rank: jsonData['rank'] ?? '',
      active: jsonData['active'] ?? '',
      rnk: jsonData['rnk'] ?? '',
    );
  }
}
