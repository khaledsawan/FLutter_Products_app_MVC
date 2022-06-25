import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/AppConstants.dart';

class ApiClient extends GetConnect implements GetxService {
  late SharedPreferences sharedPre;
  final String? main_BaseUrl;
  late String token = "";
  late Map<String, String> _Main_Headers;

 ApiClient({required this.main_BaseUrl ,required this.sharedPre}){
    baseUrl = AppConstants.BASE_URL;
    timeout = const Duration(seconds: 30);
    token =  sharedPre.getString(AppConstants.TOKEN)??"";
    _Main_Headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };}

  void updateHeaders(String token){
    _Main_Headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };}

  Future<Response> getData(String uri,{Map<String,String>? headers}) async {
    SharedPreferences sharedPreferences=Get.find();
    if(sharedPreferences.getString(AppConstants.TOKEN).toString().length>20){
      updateHeaders(sharedPreferences.getString(AppConstants.TOKEN).toString());
      try {
        Response response = await get(uri,headers: headers??_Main_Headers);
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: e.toString());
      }
    }else{
      try {
        Response response = await get(uri,headers: headers??_Main_Headers);
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: e.toString());
      }}}

  Future<Response> postData(String url, dynamic body) async {
    try {
      Response response = await post(url, body, headers: _Main_Headers);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }}}