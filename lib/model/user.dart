class UserModel {
  String username;
  // String gender;
  // DateTime Dob;
  String email;
  String phone_no;
  String student_id;
  String pswd;

  UserModel(
      {required this.username,
      required this.email,
      required this.phone_no,
      required this.student_id,
      required this.pswd});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json["username"],
      email: json["email"],
      phone_no: json["phone_no"],
      student_id: json["student_id"],
      pswd: json["pswd"],
    );
  }

  Map<String, dynamic> get toJson => {
        'username': username,
        // 'gender': gender,
        // 'Dob': Dob.toString(),
        'email': email,
        'phone_no': phone_no,
        'student_username': student_id,
        'pswd': pswd
      };
}
