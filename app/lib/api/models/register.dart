class Register {
  String email;
  String fname;
  String lname;
  String passw;
  String contact;
  Register(
    this.email,
    this.fname,
    this.lname,
    this.passw,
    this.contact,
  );

  Register.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fname = json['fname'];
    lname = json['lname'];
    passw = json['passw'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['passw'] = this.passw;
    data['contact'] = this.contact;
    return data;
  }
}
