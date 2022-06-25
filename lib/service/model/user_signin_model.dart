class UserSingInModel {
  String? phone;
  String? password;

  UserSingInModel(this.phone, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
