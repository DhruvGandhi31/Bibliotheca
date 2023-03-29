class User {
  String username;
  String gender;
  // DateTime Dob;
  String email;
  String phone_no;
  String student_id;
  String pswd;

  User(this.username, this.gender, this.email, this.phone_no, this.student_id,
      this.pswd);

  Map<String, dynamic> toJson() => {
        'username': username,
        'gender': gender,
        // 'Dob': Dob.toString(),
        'email': email,
        'phone_no': phone_no,
        'student_id': student_id,
        'pswd': pswd
      };
}
