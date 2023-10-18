import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/util/colors_util.dart';

enum AlertType { tips, error, loanFailed, success }

class CommonAlert {
  static Future<String?> showAlert({AlertType type = AlertType.tips, String? message}) async {
    switch (type) {
      case AlertType.tips:
        return await tipsDialog(message);
      case AlertType.error:
        return await errorAlert(message);
      default:
        return null;
    }
  }

  static Future<T?> tipsDialog<T>(String? message) async {
    return await Get.defaultDialog(
      title: 'TIPS',
      radius: 5,
      titlePadding: const EdgeInsets.only(top: 20),
      titleStyle: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20, fontWeight: FontWeight.w600),
      middleText: message ?? '',
      middleTextStyle: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14),
      barrierDismissible: false,
      contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorsUtil.hexColor(0x00C371))),
        child: Container(
          width: 80,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: const Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(result: 'ok'),
        child: Container(
          width: 80,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: const Text('Sure', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  static Future<T?> errorAlert<T>(String? message) async {
    return await Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      content: Column(children: [
        Container(padding: const EdgeInsets.only(bottom: 10), child: const CommonImage(src: 'assets/icons/error_icon.png')),
        Text(message ?? '', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14)),
      ]),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorsUtil.hexColor(0x00C371))),
        child: Container(
          width: 80,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: const Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(result: 'ok'),
        child: Container(
          width: 80,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: const Text('Sure', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
