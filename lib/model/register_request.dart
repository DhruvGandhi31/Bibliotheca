class RegisterRequest {
  String? username;
  String? email;
  String? phoneNo;
  String? studentId;
  String? pswd;

  RegisterRequest(
      {required this.username,
      required this.email,
      required this.phoneNo,
      required this.studentId,
      required this.pswd});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phoneNo = json['phone_no'];
    studentId = json['student_id'];
    pswd = json['pswd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['student_id'] = this.studentId;
    data['pswd'] = this.pswd;
    return data;
  }
}
