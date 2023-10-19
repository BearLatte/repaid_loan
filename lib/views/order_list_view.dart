import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/controllers/order_list_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/util/order_type.dart';
import 'package:repaid_loan/views/order_list_content_view.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'My Orders',
      extendBodyBehindAppBar: true,
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: SafeArea(
          bottom: false,
          child: GetBuilder<OrderListController>(
            builder: (controller) => Column(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
                child: const Text(
                  'If you can make your repayments on time, you can apply for a higher amount.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: ColorsUtil.hexColor(0x00C371),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
                child: TabBar(
                  tabs: controller.tabs,
                  controller: controller.tabController,
                  isScrollable: true,
                  labelStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  unselectedLabelStyle: TextStyle(color: ColorsUtil.hexColor(0xffffff, alpha: 0.5), fontSize: 16, fontWeight: FontWeight.w600),
                  indicator: const BoxDecoration(),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: List.generate(
                      controller.tabs.length,
                      (index) => OrderListContentView(type: OrderType.values[index]),
                    ).toList(),
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
