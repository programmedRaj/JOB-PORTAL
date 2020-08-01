class Login {
  int logintype;
  String contact;
  String password;
  Login({
    this.logintype,
    this.contact,
    this.password,
  });
  Login.fromJson(Map<String, dynamic> json) {
    logintype = json['logintype'];
    password = json['password'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logintype'] = this.logintype;
    data['password'] = this.password;
    data['contact'] = this.contact;
    return data;
  }
}
