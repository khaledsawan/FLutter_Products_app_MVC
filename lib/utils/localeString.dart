
import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello World',
      'Setting': 'setting',
    },
    'ar_SY': {
      'hello': 'مرحبا',
      'Setting': 'الاعداتات',
    }
  };
}