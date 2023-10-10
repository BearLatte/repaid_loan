import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/login_controller.dart';
import 'package:repaid_loan/widgets/hidden_keyboard_wraper.dart';

import '../util/colors_util.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      extendBody: true,
      extendBodyBehindAppBar: true,
      background: const CommonImage(src: 'assets/images/login_view_banner.png', width: double.infinity, fit: BoxFit.cover),
      body: HiddenKeyboardWrapper(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 145),
                child: const Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 36),
                child: Text(
                  'Please log in here',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorsUtil.hexColor(0xffffff, alpha: 0.6), fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              contentView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentView() {
    final controller = Get.find<LoginController>();

    return Obx(
      () => Container(
        padding: const EdgeInsets.only(top: 35, left: 30, right: 30, bottom: 30),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: const CommonImage(src: 'assets/icons/login_icon.png'),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text('Mobile number', style: TextStyle(color: ColorsUtil.hexColor(0xa5a5a5))),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 15, right: 10),
                  child: Text('+91', style: TextStyle(color: ColorsUtil.hexColor(0x323643), fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextField(
                      controller: controller.phoneController,
                      focusNode: controller.phoneFocusNode,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: ColorsUtil.hexColor(0x323643), fontSize: 20, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        hintText: 'Mobile number',
                        hintStyle: TextStyle(color: ColorsUtil.hexColor(0x323643), fontSize: 20, fontWeight: FontWeight.w600),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                if (controller.isShowGetOTP.value)
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 40,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: controller.getOTP,
                      child: const Text('Get OTP', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Divider(color: ColorsUtil.hexColor(0xE1E3E8), height: 1),
            ),
            Container(
              padding: const EdgeInsets.only(top: 45),
              alignment: Alignment.centerLeft,
              child: Text('One-time-Password', style: TextStyle(color: ColorsUtil.hexColor(0xa5a5a5))),
            ),
            TextField(
              controller: controller.codeController,
              obscureText: controller.isSecurityType.value,
              style: TextStyle(color: ColorsUtil.hexColor(0x323643), fontSize: 20, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'One-time-Password',
                hintStyle: TextStyle(color: ColorsUtil.hexColor(0x323643), fontSize: 20, fontWeight: FontWeight.w600),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: controller.switchSecurityType,
                  icon: Container(
                    width: 44,
                    alignment: Alignment.centerRight,
                    child: CommonImage(src: controller.isSecurityType.value ? 'assets/icons/eye_icon_normal.png' : 'assets/icons/eye_icon.png'),
                  ),
                ),
              ),
            ),
            Divider(color: ColorsUtil.hexColor(0xE1E3E8), height: 1),
            Container(
              height: 54,
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                onPressed: controller.login,
                child: const Row(
                  children: <Widget>[
                    Spacer(),
                    Text('Login now', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                    Spacer(),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 85),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: controller.switchCheckedPrivacy,
                    icon: Icon(controller.isCheckedPrivacy.value ? Icons.radio_button_checked : Icons.radio_button_off, size: 38, color: ColorsUtil.hexColor(0x00AD8E)),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  Expanded(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: 'By continuing you agree our ', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14)),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(color: ColorsUtil.hexColor(0x00AD8E), fontSize: 14),
                        recognizer: controller.termsTap,
                      ),
                      TextSpan(text: ' and ', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14)),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: ColorsUtil.hexColor(0x00AD8E), fontSize: 14),
                        recognizer: controller.privacyTap,
                      ),
                      TextSpan(text: '.', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14)),
                    ])),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
