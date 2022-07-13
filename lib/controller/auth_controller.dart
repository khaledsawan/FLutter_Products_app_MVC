import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/widgets/Custom_snackpar/show_custom_snackpar_red.dart';
import '../service/model/response_model.dart';
import '../service/model/user_signin_model.dart';
import '../service/model/user_signup_model.dart';
import '../service/repository/auth_repo.dart';
import '../utils/AppConstants.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  SharedPreferences sharedPreferences;
  AuthController({required this.authRepo, required this.sharedPreferences});
  bool _isloading = false;
  bool get isloading => _isloading;

  Future<ResponseModel> register_function(UserSignUpModel userSignUpModel) async {
    _isloading = true;
    ResponseModel responseModel;
    Response response = await authRepo.registeration(userSignUpModel);
    // print('token=>' + response.body["token"].toString());
    if (response.statusCode == 200) {
      _isloading = false;
      responseModel = ResponseModel(massage: response.body["token"], isSuccessful: true);
      authRepo.saveUserToken(response.body["token"]);
      print('token=>' + response.body["token"].toString());
      sharedPreferences.setString(AppConstants.TOKEN, response.body["token"].toString());
      saveUserPhoneAndPassword(userSignUpModel.email!, userSignUpModel.password!);
    } else {
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    _isloading = false;
    update();
    print('authRepo.getToken()'+authRepo.getToken());

    return responseModel;
  }

  Future<ResponseModel> login_function(UserSingInModel userLoginModel) async {
    _isloading = true;
    ResponseModel responseModel;
    Response response = await authRepo.login_function(userLoginModel);

    if (response.statusCode == 200) {
      _isloading = false;
      responseModel =
          ResponseModel(massage: response.body["token"], isSuccessful: true);
      authRepo.saveUserToken(response.body["token"]);
      sharedPreferences.setString(
          AppConstants.TOKEN, response.body["token"].toString());
      print('token=>' + response.body["token"].toString());
      saveUserPhoneAndPassword(userLoginModel.email!, userLoginModel.password!);
    } else {
      ShowCustomSnackparRed('not done ', 'error');
      responseModel =
          ResponseModel(massage: response.statusText!, isSuccessful: false);
    }
    _isloading = false;
    update();
    return responseModel;
  }

  saveUserPhoneAndPassword(String email, String password) {
    authRepo.saveUserPhoneAndPassword(email, password);
  }

  clearUserAuth() async {
    await authRepo.clearUserAuth();
    update();
  }

  bool isAuth() {
    return authRepo.isAuth();
  }

  String gettoken() {
    return authRepo.getToken();
  }
}
