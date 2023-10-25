import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileController extends GetxController {
  bool isLogin = false;
  String accountText = 'Please log in';

  @override
  void onInit() {
    checkoutInfo();
    super.onInit();
  }

  void checkoutInfo() async {
    isLogin = await Global.isLogin;
    accountText = isLogin ? (await Global.accountPhone)! : 'Please log in';
    update();
  }

  void feedbackOnPressed() async {
    if (await Global.isLogin) {
      Get.toNamed(Routes.feedbackList);
    } else {
      Get.toNamed(Routes.login);
    }
    debugPrint('DEBUG: 点击 Feedback');
  }

  void privacyOnPressed() async {
    if (await canLaunchUrlString('https://www.youtube.com')) {
      launchUrlString('https://www.youtube.com', mode: LaunchMode.inAppWebView);
    }
  }

  void aboutUsOnPressed() async => Get.toNamed(Routes.aboutUs, arguments: await Global.packageVersion());

  void logout() async {
    await ApiUtil.logout();
    Global.logoutConfig();
    checkoutInfo();
  }
}
