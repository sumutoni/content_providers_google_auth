import 'package:get/get.dart';
class ImageController extends GetxController{
   var profilePicPathSet = false.obs;
   var profilePicPath = "".obs;

   void setProfilePicPath(String path){
    profilePicPath.value = path;
    profilePicPathSet.value = true;
   }
}