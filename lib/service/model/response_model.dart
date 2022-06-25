class ResponseModel {
 late String? massage;
 late bool? isSuccessful;

ResponseModel({required this.massage,required this.isSuccessful});
  ResponseModel.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    isSuccessful = json['isSuccessful'];

  }
}
