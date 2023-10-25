import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/order_detail_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/views/product_cell.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      builder: (controller) {
        return FocusDetector(
          onFocusGained: () => controller.getOrderDetail(Get.arguments),
          child: BaseView(
            title: controller.title,
            extendBodyBehindAppBar: true,
            background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
            body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  if (controller.indicatorText != null)
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
                      child: Text(
                        controller.indicatorText!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                      child: controller.order == null
                          ? Container()
                          : Column(
                              children: [
                                if (controller.detailType != OrderDetailType.throughFrozen) orderInfoView(controller),
                                if (controller.detailType != OrderDetailType.disbursingFailed &&
                                    controller.detailType != OrderDetailType.unRepay &&
                                    controller.detailType != OrderDetailType.overduePayed)
                                  Expanded(
                                      child: ListView(
                                          children:
                                              controller.recommendProducts.map((product) => ProductCell(product: product, onPressed: () => controller.recommendProductOnPressed(product))).toList())),
                                if (controller.detailType == OrderDetailType.unRepay || controller.detailType == OrderDetailType.overdue)
                                  Expanded(child: Container(child: repayBtnExtensionView(controller)))
                              ],
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget repayBtnExtensionView(OrderDetailController controller) {
    return Column(children: [
      const Spacer(),
      Container(
        height: 54,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 30, right: 30),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
          onPressed: controller.repayBtnOnPressed,
          child: const Text('Repay Now', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
      if (controller.extendBtnVisible)
        Container(
          height: 54,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
            onPressed: controller.extensionBtnOnPressed,
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorsUtil.hexColor(0x00C371))),
            child: const Text('Repay Extension', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
          ),
        ),
      const Padding(padding: EdgeInsets.only(bottom: 35)),
    ]);
  }

  Widget orderInfoView(OrderDetailController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (controller.order?.logo != null) ClipOval(child: CommonImage(src: controller.order!.logo, width: 50)),
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  controller.order?.loanName ?? '',
                  style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20),
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          orderItemView('Loan amount', '₹ ${controller.order?.loanAmountStr}'),
          orderItemView('Apply date', controller.order?.applyDateStr ?? ''),
          orderItemView('Account', controller.order?.bankCardNo ?? ''),
          if (controller.detailType == OrderDetailType.unRepay ||
              controller.detailType == OrderDetailType.overdue ||
              controller.detailType == OrderDetailType.payed ||
              controller.detailType == OrderDetailType.overduePayed)
            moreInfoItem(controller),
        ],
      ),
    );
  }

  Widget moreInfoItem(OrderDetailController controller) {
    return Column(children: [
      orderItemView('Received Amount', '₹ ${controller.order?.receiveAmountStr}'),
      orderItemView('Date of loan received', controller.order?.receiveDateStr ?? ''),
      if (controller.detailType == OrderDetailType.overdue || controller.detailType == OrderDetailType.overduePayed) orderItemView('Overdue Charge', controller.order?.overDueFeeStr ?? ''),
      if (controller.detailType == OrderDetailType.overdue || controller.detailType == OrderDetailType.overduePayed) orderItemView('Overdue Days', '${controller.order?.overDueDays}'),
      orderItemView('Repayment Amount', '₹ ${controller.order?.repayAmountStr}'),
      orderItemView('Repayment Date', controller.order?.repayDateStr ?? ''),
    ]);
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
