import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/controllers/order_detail_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      builder: (controller) => BaseView(
        title: controller.title,
        extendBodyBehindAppBar: true,
        background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
