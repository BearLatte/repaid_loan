import 'package:flutter/material.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/util/colors_util.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'My Orders',
      extendBodyBehindAppBar: true,
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: SafeArea(bottom: false, child: Container(color: Colors.orange)),
    );
  }
}
