class UserSingInModel {
  String? email;
  String? password;

  UserSingInModel(this.email, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
