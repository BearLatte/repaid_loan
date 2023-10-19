import 'package:flutter/material.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/util/colors_util.dart';

class RepayExtensionView extends StatelessWidget {
  const RepayExtensionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Repay Extension',
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: SafeArea(child: Column()),
    );
  }
}
