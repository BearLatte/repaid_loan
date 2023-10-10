import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/util/colors_util.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'About Us',
      extendBodyBehindAppBar: true,
      background: Column(
        children: [Container(height: 300, color: ColorsUtil.hexColor(0x00AD8E)), Expanded(child: Container(color: Colors.white))],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const CommonImage(src: 'assets/images/about_us_img.png'),
              const Spacer(),
              Text('Version ${Get.arguments}', textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
