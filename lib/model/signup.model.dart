class SignUpModel {
  String? username;
  String? email;
  String? password;

  SignUpModel({this.username, this.email, this.password});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}