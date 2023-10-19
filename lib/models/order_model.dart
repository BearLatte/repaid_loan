import 'dart:convert';
import 'dart:ui';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/order_model.g.dart';
import 'package:repaid_loan/util/colors_util.dart';

export 'package:repaid_loan/generated/json/order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String? bankCardNo;
  late String logo;
  late String loanName;
  late String productId;
  late String loanOrderNo;
  late String applyDateStr;
  late String loanAmountStr;
  late int loanDate;
  late String receiveAmountStr;
  late String repayAmountStr;
  String? repayDateStr;
  late int overDueDays;
  String? overDueFeeStr;
  late int status;
  String? receiveDateStr;

  /// 距离还款日时间
  int? daysToRepay;

  String get statusText {
    switch (status) {
      case 0:
        return 'Pending';
      case 1:
        return 'Disbursing';
      case 2:
        return 'To be Repaid';
      case 5:
        return 'Overdue';
      case 6:
        return 'Disbursing Fail';
      case 7:
        return 'Denied';
      case 8:
      case 9:
        return 'Repaid';
    }
    return '';
  }

  Color? get statusColor {
    switch (status) {
      case 0:
        return ColorsUtil.hexColor(0x1489EB);
      case 1:
        return ColorsUtil.hexColor(0x00AD8E);
      case 2:
        return ColorsUtil.hexColor(0xF59C0D);
      case 5:
        return ColorsUtil.hexColor(0xF73D3D);
      case 6:
      case 7:
        return ColorsUtil.hexColor(0xF73DED);

      case 8:
      case 9:
        return ColorsUtil.hexColor(0x999999);
    }
    return null;
  }

  OrderModel();

  factory OrderModel.fromJson(Map<String, dynamic> json) => $OrderModelFromJson(json);

  Map<String, dynamic> toJson() => $OrderModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
