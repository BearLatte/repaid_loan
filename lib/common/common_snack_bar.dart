import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackType { info, error, success }

class CommonSnackBar {
  static void showSnackBar(String message, {String? title, SnackType type = SnackType.info}) {
    String snackBarTitle = title ?? (type == SnackType.info ? 'Info' : (type == SnackType.error ? 'Error' : 'Success'));
    IconData snackBarIcon = type == SnackType.info ? Icons.info : (type == SnackType.error ? Icons.error : Icons.check);
    Color iconColor = type == SnackType.info ? Colors.orange : (type == SnackType.error ? Colors.red : Colors.greenAccent);
    Get.showSnackbar(
      GetSnackBar(
        titleText: Text(
          snackBarTitle,
          style: const TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        messageText: Text(
          message,
          style: const TextStyle(fontSize: 14.0, color: Colors.black87),
        ),
        icon: Icon(snackBarIcon, size: 50, color: iconColor),
        backgroundColor: Colors.grey.withOpacity(0.2),
        barBlur: 7.0,
        borderRadius: 10.0,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 8, right: 8),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
