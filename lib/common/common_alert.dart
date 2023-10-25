import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/util/colors_util.dart';

import '../models/pay_fail_info_model.dart';

enum AlertType { tips, error, loanFailed, success }

class CommonAlert {
  static Future<String?> showAlert({AlertType type = AlertType.tips, String? message, PayFailInfoModel? infoModel, bool isShowTitle = true}) async {
    switch (type) {
      case AlertType.tips:
        return await tipsDialog(message, isShowTitle);
      case AlertType.error:
        return await errorAlert(message);
      case AlertType.loanFailed:
        return await loanFailedAlert(infoModel);
      case AlertType.success:
        return await successAlert(message: message);
    }
  }

  static Future<String?> successAlert({String? message}) async {
    return await Get.defaultDialog(
      backgroundColor: Colors.transparent,
      title: '',
      titlePadding: EdgeInsets.zero,
      barrierDismissible: false,
      content: Stack(
        children: [
          const CommonImage(src: 'assets/images/feedback_save_success_img.png'),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Text(message ?? '', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20)),
                Container(
                  width: double.infinity,
                  height: 54,
                  margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: ElevatedButton(onPressed: () => Get.back(result: 'ok'), child: const Text('OK', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Future<String?> loanFailedAlert(PayFailInfoModel? infoModel) async {
    return await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      titlePadding: EdgeInsets.zero,
      barrierDismissible: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(child: CommonImage(src: infoModel!.logo, width: 50)),
              const Padding(padding: EdgeInsets.only(left: 15)),
              Text(infoModel!.loanName, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Order Number', style: TextStyle(color: ColorsUtil.hexColor(0xA5A5A5), fontSize: 16)),
              Text(infoModel.loanOrderNo, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 16)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(infoModel.content, textAlign: TextAlign.center, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14)),
          ),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(result: 'ok'),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: const Text('OK', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  static Future<T?> tipsDialog<T>(String? message, bool? isShowTitle) async {
    return await Get.defaultDialog(
      title: isShowTitle == true ? 'TIPS' : '',
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
