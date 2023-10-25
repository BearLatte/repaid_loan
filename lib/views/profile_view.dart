import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/profile_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return BaseView(
        extendBodyBehindAppBar: true,
        background: const CommonImage(src: 'assets/images/profile_banner.png', width: double.infinity, fit: BoxFit.cover),
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
          padding: const EdgeInsets.fromLTRB(55, 20, 55, 35),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: FocusDetector(
            onFocusGained: controller.checkoutInfo,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CommonImage(src: controller.isLogin ? 'assets/icons/login_logo.png' : 'assets/icons/not_login_logo.png'),
                    Container(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(controller.accountText, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20)),
                    ),
                  ],
                ),
              ),
              profileItemCell('Feedback', icon: 'assets/icons/feedback_icon.png', onPressed: controller.feedbackOnPressed),
              profileItemCell('Privacy Policy', icon: 'assets/icons/privacy_icon.png', onPressed: controller.privacyOnPressed),
              profileItemCell('About Us', icon: 'assets/icons/about_us_icon.png', onPressed: controller.aboutUsOnPressed),
              if (controller.isLogin) profileItemCell('Delete account', icon: 'assets/icons/delete_icon.png', onPressed: controller.logout),
              const Spacer(),
              if (controller.isLogin)
                Container(
                  decoration: BoxDecoration(color: ColorsUtil.hexColor(0xE2E2E2), borderRadius: BorderRadius.circular(10)),
                  child: TextButton(onPressed: controller.logout, child: const Text('Logout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
                ),
            ]),
          ),
        ),
      );
    });
  }

  Widget profileItemCell(String title, {required String icon, Function()? onPressed}) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: CommonImage(src: icon)),
              Text(title, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
