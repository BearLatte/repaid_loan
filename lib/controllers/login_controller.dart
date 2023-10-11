import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../util/api_util/index.dart';

class LoginController extends GetxController {
  var isSecurityType = false.obs;
  var isCheckedPrivacy = true.obs;
  var isShowGetOTP = true.obs;
  Timer? _timer;
  int _totalTime = 60;
  FocusNode phoneFocusNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  /// Terms & Conditions 点击识别
  TapGestureRecognizer termsTap = TapGestureRecognizer()
    ..onTap = () async {
      if (await canLaunchUrlString('https://www.youtube.com')) {
        launchUrlString('https://www.youtube.com', mode: LaunchMode.inAppWebView);
      }
    };

  /// privacy 点击识别
  TapGestureRecognizer privacyTap = TapGestureRecognizer()
    ..onTap = () async {
      if (await canLaunchUrlString('https://www.youtube.com')) {
        launchUrlString('https://www.youtube.com', mode: LaunchMode.inAppWebView);
      }
    };

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(() {
      if (phoneController.text.length > 10) {
        phoneFocusNode.unfocus();
        phoneController.text = phoneController.text.substring(0, 10);
      }
    });
    codeController.text = '821350';
  }

  @override
  void onClose() {
    phoneFocusNode.dispose();
    phoneController.dispose();
    codeController.dispose();
    _timer?.cancel();
    _timer = null;
    _totalTime = 60;
    super.onClose();
  }

  void switchSecurityType() => isSecurityType.value = !isSecurityType.value;
  void switchCheckedPrivacy() => isCheckedPrivacy.value = !isCheckedPrivacy.value;

  void getOTP() async {
    if (phoneController.text.trim().isEmpty) {
      return CommonSnackBar.showSnackBar('Please enter a 10-digit mobile number');
    }
    await ApiUtil.sendOTP(phoneController.text);
    CommonSnackBar.showSnackBar('OTP Send Success', type: SnackType.success);
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      _totalTime--;
      if (_totalTime > 0) {
        isShowGetOTP.value = false;
      } else {
        _timer!.cancel();
        _timer = null;
        isShowGetOTP.value = true;
        _totalTime = 60;
      }
    });
  }

  void login() async {
    if (phoneController.text.trim().isEmpty || phoneController.text.trim().length != 10) {
      return CommonSnackBar.showSnackBar('Please enter a 10-digit mobile number');
    }

    if (codeController.text.trim().isEmpty) {
      return CommonSnackBar.showSnackBar('Please enter correct OTP');
    }

    if (!isCheckedPrivacy.value) {
      return CommonSnackBar.showSnackBar('Please agree with our policy to continue');
    }

    ContModel cont = await ApiUtil.login(phoneController.text, codeController.text);
    if (cont.isLogin == 0) {
      debugPrint('DEBUG: 此处需要做FB和ADJust埋点');
    }

    await Global.loginSuccessConfig(cont, phoneController.text);
    Get.back();
  }
}
