import 'dart:convert';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/pay_fail_info_model.g.dart';

export 'package:repaid_loan/generated/json/pay_fail_info_model.g.dart';

@JsonSerializable()
class PayFailInfoModel {
  late String loanOrderNo;
  late String loanName;
  late String logo;
  late String content;

  PayFailInfoModel();

  factory PayFailInfoModel.fromJson(Map<String, dynamic> json) => $PayFailInfoModelFromJson(json);

  Map<String, dynamic> toJson() => $PayFailInfoModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
