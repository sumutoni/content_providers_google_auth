import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController{
    final Connectivity _connectivity = Connectivity(); 

    @override
    void onInit(){
      super.onInit();
      _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }

    void _updateConnectionStatus(ConnectivityResult connectivityResult){
        if (connectivityResult == ConnectivityResult.none){
          if (Get.isSnackbarOpen){
            Get.closeCurrentSnackbar();
          }
          Get.rawSnackbar(
            messageText: const Center(child: Text('No internet Connection', style: TextStyle(color: Colors.white, fontSize: 14.0),)),
            isDismissible: false,
            duration: const Duration(seconds: 25),
            backgroundColor: const Color.fromARGB(255, 66, 21, 117),
            icon: const Center(child: Icon(Icons.wifi_off, color: Colors.white, size: 20,)),
            margin: const EdgeInsets.symmetric(vertical: 0),
            padding: const EdgeInsets.all(5.0),
            snackStyle: SnackStyle.GROUNDED,

          );
        }
        else{
          if (Get.isSnackbarOpen){
            Get.closeCurrentSnackbar();
          }
          Get.rawSnackbar(
            messageText: const Center(child: Text('Online', style: TextStyle(color: Colors.white, fontSize: 14.0),)),
            isDismissible: false,
            duration: const Duration(seconds: 25),
            backgroundColor: const Color.fromARGB(255, 66, 21, 117),
            icon: const Center(child: Icon(Icons.wifi, color: Colors.white, size: 20,)),
            margin: const EdgeInsets.symmetric(vertical: 0),
            padding: const EdgeInsets.all(5.0),
            snackStyle: SnackStyle.GROUNDED,

          );
        }
    }
}