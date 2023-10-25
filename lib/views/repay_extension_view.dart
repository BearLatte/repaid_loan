import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/extension_pay_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';

class RepayExtensionView extends StatelessWidget {
  const RepayExtensionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExtensionPayController>();
    controller.orderNumber = Get.arguments['orderNumber'];
    return FocusDetector(
      onForegroundGained: Get.back,
      child: BaseView(
        title: 'Repay Extension',
        extendBodyBehindAppBar: true,
        background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 10),
                child: const Text(
                  'To extend the loan period, please pay the extension fee.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 35),
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                  child: GetBuilder<ExtensionPayController>(builder: (controller) {
                    if (controller.cont == null) {
                      return Container();
                    }
                    return Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        ClipOval(child: CommonImage(src: Get.arguments['logo'], width: 50)),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(Get.arguments['productName'], style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20)),
                        )
                      ]),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      orderItemView('Extension Fee', '₹ ${controller.cont?.extendFee}'),
                      orderItemView('Extension Term', '${controller.cont?.extendDate} days'),
                      orderItemView('Next Repayment Date', '${controller.cont?.extendRepayDate}'),
                      orderItemView('Repayment Amount', '₹ ${controller.cont?.extendRepayAmount}'),
                      const Spacer(),
                      Container(
                        height: 54,
                        width: double.infinity,
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          onPressed: controller.extensionNowOnPressed,
                          child: const Text('Extension now', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                      )
                    ]);
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget orderItemView(String key, String value) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key, style: TextStyle(color: ColorsUtil.hexColor(0xa5a5a5), fontSize: 18)),
          Text(value, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 18)),
        ],
      ),
    );
  }
}
