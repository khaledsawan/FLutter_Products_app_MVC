import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/AppConstants.dart';
import '../api/api_client.dart';
import '../model/user_signin_model.dart';
import '../model/user_signup_model.dart';

class AuthRepo extends GetxService {
  ApiClient apiClient;
  SharedPreferences sharedPreferences;


  AuthRepo(
      {required this.apiClient,
      required this.sharedPreferences,
     });

  Future<Response> registeration(UserSignUpModel userSignUpModel) async {
    print(userSignUpModel.email);
    print(userSignUpModel.password);
    print(userSignUpModel.name);
    // userSignUpModel.name='ahmad';
    // userSignUpModel.email='ahmada@gmail.com';
    // userSignUpModel.password='12345678';
    // print(userSignUpModel.email);
    // print(userSignUpModel.password);
    // print(userSignUpModel.name);
    print('//////////////////////////////////');
    Response response = await apiClient.postData(
        AppConstants.REGISTER_URL, userSignUpModel.toJson());
    return response;
  }

  Future<Response> login_function(UserSingInModel userLoginModel) async {
    print(userLoginModel.email);
    print(userLoginModel.password);
    print('//////////////////////////////////');
    Response response = await apiClient.postData(
        AppConstants.LOGIN_URL, userLoginModel.toJson());
    return response;
  }

  saveUserToken(String token) {
    token = apiClient.token;
    apiClient.updateHeaders(token);
    print('update headers //:' + token.toString());

    sharedPreferences.setString(AppConstants.TOKEN, token);
    print('update headers after save//:' +
        sharedPreferences.getString(AppConstants.TOKEN).toString());


  }

  Future<void> saveUserPhoneAndPassword(String email, String password) async {
    await sharedPreferences.setString(AppConstants.EMAIL, email);

    await sharedPreferences.setString(AppConstants.PASSWORD, password);

  }

  bool isAuth() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  String getToken() {
    return sharedPreferences.getString(AppConstants.TOKEN).toString();
  }

  Future<bool> clearUserAuth() async {
    if (await sharedPreferences.remove(AppConstants.TOKEN) &&
        await sharedPreferences.remove(AppConstants.PHONE) &&
        await sharedPreferences.remove(AppConstants.PASSWORD)) {
      apiClient.token = '';
      apiClient.updateHeaders('');

      return true;
    } else {
      return false;
    }
  }


}
