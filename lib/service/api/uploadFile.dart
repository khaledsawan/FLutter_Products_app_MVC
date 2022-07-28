import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:test1/service/model/product_store_model.dart';
import 'package:test1/utils/AppConstants.dart';

class UploadFile {
  Map<String, String> _Main_Headers = {
    'Content-type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer',
  };
  Future<http.StreamedResponse> storeProduct(
      PickedFile? data, ProductStoreModel productStoreModel) async {
    http.MultipartRequest request = http.MultipartRequest('POST',
        Uri.parse(AppConstants.BASE_URL + AppConstants.PRODUCT_URL_STORE));
    request.headers.addAll(<String, String>{'Authorization': 'Bearer'});
    if (GetPlatform.isMobile && data != null) {
      File _file = File(data.path);
      request.files.add(http.MultipartFile(
          'image', _file.readAsBytes().asStream(), _file.lengthSync(),
          filename: _file.path.split('/').last));
    }
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      'name': 'productStoreModel.name!',
      'location': 'productStoreModel.location!',
      'price': 'productStoreModel.price!.toString()',
      'category': 'productStoreModel.category!',
      'descirption': 'productStoreModel.descirption!',
      'quantity': 'productStoreModel.quantity!.toString()',
    });
    request.fields.addAll(_fields);
   // request.fields['name'] = 'someone@somewhere.com';   // request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();

    return response;
  }
}
