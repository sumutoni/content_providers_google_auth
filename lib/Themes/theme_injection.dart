import 'package:get/get.dart';

import 'theme.dart';

class ThemeInjectcion{
  static void init(){
    Get.put<ThemeController>(ThemeController(), permanent: true);
  }
}