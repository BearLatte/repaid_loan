import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/util/colors_util.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  final Widget? background;
  final bool showBackButton;
  final String? title;
  const BaseView({super.key, required this.body, this.showBackButton = true, this.title, this.background});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: showBackButton ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_sharp)) : null,
        title: Text(title ?? '', style: const TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Stack(
        children: [background ?? Container(color: ColorsUtil.hexColor(0xf5f5f5)), body],
      ),
    );
  }
}