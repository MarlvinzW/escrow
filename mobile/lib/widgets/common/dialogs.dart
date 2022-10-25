import 'package:escrow_mobile/bloc/events/snack_bar_actions.dart';
import 'package:escrow_mobile/utils/contstants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/*
* LOADER POP UP
*/

loadingDialog({required Color color, required String text}) {
  return Get.defaultDialog(
      title: '',
      barrierDismissible: false,
      backgroundColor: Colors.white70,
      content: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: SpinKitFadingCube(
                color: color,
              )),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          )
        ],
      ));
}

/*
* SUCCESS POP UP NOTIFICATION
*/

snackBar({
  required String message,
  required SnackBarActions action,
  bool pause = false,
}) {
  return Get.rawSnackbar(
      mainButton: Visibility(
          visible: pause,
          child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.close, color: Colors.white))),
      borderRadius: 5,
      margin: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
      messageText: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor:
          action == SnackBarActions.success ? Constants.appColor : Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: pause ? const Duration(days: 1) : const Duration(seconds: 3));
}

/*
* LOADER
*/

class Loader extends StatelessWidget {
  final Color color;

  const Loader({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitFadingCube(
      color: color,
    ));
  }
}
