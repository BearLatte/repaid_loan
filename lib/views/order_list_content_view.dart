import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/order_list_content_controller.dart';
import 'package:repaid_loan/models/order_model.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/util/order_type.dart';
import 'package:repaid_loan/widgets/dotted_line_widget.dart';

class OrderListContentView extends StatelessWidget {
  final OrderType type;
  const OrderListContentView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderListContentController(), tag: type.toString());
    return FocusDetector(
        onFocusGained: () => controller.loadOrders(type),
        child: Obx(() => ListView(
              children: controller.orders.value.map((order) => orderCell(order, onTap: () => controller.orderItemOnTap(order))).toList(),
            )));
  }

  Widget orderCell(OrderModel order, {Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: CommonImage(src: order.logo, width: 50),
                  ),
                  Text(order.loanName, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 18, fontWeight: FontWeight.w600))
                ],
              ),
              Text(order.statusText, style: TextStyle(color: order.statusColor, fontSize: 20, fontWeight: FontWeight.w600))
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '₹ ${order.loanAmountStr}',
                      style: TextStyle(color: ColorsUtil.hexColor(0x00AD8E), fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text('Loan amount', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      order.applyDateStr,
                      style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text('Apply date', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14))
                  ],
                ),
              ],
            ),
          ),
          Text('Order Number : ${order.loanOrderNo}', style: TextStyle(color: ColorsUtil.hexColor(0x999999))),
          const Padding(padding: EdgeInsets.only(top: 20)),
          DottedLine(color: ColorsUtil.hexColor(0xE2E2E2)),
        ],
      ),
    );
  }
}
