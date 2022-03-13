import 'package:get/get.dart';

import '../utils/langs/ar.dart';
import '../utils/langs/en.dart';

class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
