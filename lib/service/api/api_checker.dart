import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../widgets/Custom_snackpar/show_custom_snackPar_red.dart';


class ApiChecker{
  static void checkerApi(Response response){
    if(response.statusCode==401){
      Get.offNamed(AppRoutes.login);
    }else{
      ShowCustomSnackparRed(response.statusText!.toString(), '');
    }
  }
}