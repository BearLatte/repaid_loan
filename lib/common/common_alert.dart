import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/util/colors_util.dart';

enum AlertType { tips, error, loanFailed, success }

class CommonAlert {
  static Future<String?> showAlert({AlertType type = AlertType.tips, String? message}) async {
    return await Get.defaultDialog(
      title: type == AlertType.tips ? 'TIPS' : '',
      radius: 5,
      titlePadding: const EdgeInsets.only(top: 20),
      titleStyle: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20, fontWeight: FontWeight.w600),
      middleText: message ?? '',
      middleTextStyle: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14),
      barrierDismissible: false,
      contentPadding: const EdgeInsets.only(bottom: 20),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorsUtil.hexColor(0x00C371))),
        child: Container(
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: const Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(result: 'ok'),
        child: Container(
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: const Text('Sure', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
