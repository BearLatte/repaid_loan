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
    return Container(
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
          TextField(
            controller: controller.phoneController,
            style: TextStyle(color: ColorsUtil.hexColor(0x323643), fontSize: 20, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                prefixIcon: Container(
                  width: 1,
                  alignment: Alignment.centerLeft,
                  child: Text('+91', style: TextStyle(color: ColorsUtil.hexColor(0x323643), fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(color: ColorsUtil.hexColor(0x00AD8E), borderRadius: BorderRadius.circular(25)),
                )),
          )
        ],
      ),
    );
  }
}
