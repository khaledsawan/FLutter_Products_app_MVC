class UserSignUpModel {
  String? f_name;
  String? phone;
  String? email;
  String? password;

  UserSignUpModel(this.f_name, this.phone, this.email, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['f_name'] = f_name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
