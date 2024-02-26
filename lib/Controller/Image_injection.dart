import 'package:get/get.dart';
import 'image_controller.dart';

class ImageInjection{
  static void init(){
    Get.put<ImageController>(ImageController(), permanent:true);
  }
}