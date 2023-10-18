import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaid_loan/common/common_alert.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';
import 'package:repaid_loan/util/api_util/response_model.dart';

class ProductDetailController extends GetxController {
  late String productId;
  late String loanAmount;
  late String loanDate;

  bool isFaceRecognize = false;

  @override
  void onInit() {
    checkoutUserFaceRecognize();
    super.onInit();
  }

  Future<void> checkoutUserFaceRecognize() async {
    ContModel cont = await ApiUtil.fetchUserInfo();
    isFaceRecognize = cont.userLiveness == 1;
  }

  void loanProductOnPressed() async {
    if (isFaceRecognize) {
      // 配置参数并购买
      configParamsAndPurchaseProduct();
    } else {
      String? result = await CommonAlert.showAlert(message: 'Please upload a selfie photo before continuing.');
      if (result == 'ok') {
        takeFacePictureAction();
      }
    }
  }

  void configParamsAndPurchaseProduct() async {
    if (!(await Global.isTestAccount)) {
      // 定位权限
      PermissionStatus locationStatus = await Permission.location.request();
      if (locationStatus != PermissionStatus.granted) {
        var result =
            await CommonAlert.showAlert(message: 'This feature requires you to authorize this app to open the location service\nHow to set it: open phone Settings -> Privacy -> Location service');
        if (result == 'ok') {
          openAppSettings();
        }
        return;
      }

      // 联系人权限

      PermissionStatus contactStatus = await Permission.contacts.request();
      if (contactStatus != PermissionStatus.granted) {
        return CommonSnackBar.showSnackBar('You did not allow us to access the contacts. Allowing it will help you obtain a loan. Do you want to set up authorization.');
      }
    }

    IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;

    Map<String, dynamic> params = {'productId': productId, 'loanAmount': loanAmount, 'loanDate': loanDate};
    Map<String, dynamic> data = {};

    var deviceInfo = await Global.channel.invokeMethod('getDeviceInfo');
    deviceInfo['idfa'] = await Global.advertisingId;
    deviceInfo['appOpenTime'] = await Global.appOpenTime;
    if (!(await Global.isTestAccount)) {
      Position locationData = await Geolocator.getCurrentPosition();
      deviceInfo['latitude'] = '${locationData.latitude}';
      deviceInfo['longitude'] = '${locationData.longitude}';
    }

    data['deviceAllInfo'] = deviceInfo;
    List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
    List<Map<String, String>> phoneList = contacts
        .map((contact) => {
              'contactDisplayName': contact.displayName,
              'number': contact.phones.isEmpty ? '' : contact.phones.first.number,
            })
        .toList();
    data['phoneList'] = phoneList;
    params['data'] = jsonEncode(data);
    ResponseModel<ProductModel> response = await ApiUtil.uploadDeviceInfoAndPurchaseProduct(params);
    ContModel cont = response.cont!;
    if (cont.isFirstApply == 1) {
      debugPrint('DEBUG: 发送adjust和facebook 的首贷下单事件');
    }
    Get.offNamedUntil(Routes.purchaseSuccess, (route) => route.isFirst, arguments: response.list);
  }

  void takeFacePictureAction() async {
    PermissionStatus status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      return CommonSnackBar.showSnackBar(
        'You did not allow us to access the camera, which will help you obtain a loan. Would you like to set up authorization.',
        type: SnackType.error,
      );
    }
    var result = await Global.channel.invokeMethod('go2takeFacePicture');
    String? imgPath = result['imgPath'];
    if (imgPath == null) {
      String? alertResult = await CommonAlert.showAlert(message: 'Upload failed, please try again.', type: AlertType.error);
      if (alertResult == 'ok') {
        return takeFacePictureAction();
      }
    }

    bool isSuccess = await ApiUtil.faceAuthenticate(imgPath!);
    await checkoutUserFaceRecognize();
    loanProductOnPressed();
  }
}
