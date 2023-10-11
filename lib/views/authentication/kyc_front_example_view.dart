import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/util/colors_util.dart';

class KYCFrontExampleView extends StatelessWidget {
  const KYCFrontExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Photo Tips',
      extendBodyBehindAppBar: true,
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: <Widget>[
                  const Expanded(child: CommonImage(src: 'assets/images/example_correct_img.png', fit: BoxFit.cover)),
                  Container(
                    width: 150,
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Demonstration', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 16, fontWeight: FontWeight.w600)),
                      const Padding(padding: EdgeInsets.only(bottom: 6)),
                      Text('Please ensure the whole content involved and words clear.', style: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 14)),
                    ]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 35),
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text('Unusable', textAlign: TextAlign.center, style: TextStyle(color: ColorsUtil.hexColor(0xD81E06), fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    errorItem('assets/images/example_over_frame_img.png', 'Card shall not outside the frame.'),
                    errorItem('assets/images/example_blurred_img.png', 'Photo shall not be blurred.'),
                    errorItem('assets/images/example_overexposure_img.png', 'No reflection light on it.'),
                    const Spacer(),
                    Container(
                      height: 54,
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        onPressed: () => Get.back(result: 'ok'),
                        child: const Text('OK', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget errorItem(String icon, String indicatorText) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Row(children: [
        Expanded(child: CommonImage(src: icon, fit: BoxFit.cover)),
        Container(
          width: 170,
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonImage(src: 'assets/icons/error_icon.png'),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Text(indicatorText, style: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 16)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
