import 'dart:convert';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/product_detail_model.g.dart';

export 'package:repaid_loan/generated/json/product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel {
  late String logo;
  late String spaceName;
  String? productId;
  late String loanAmountStr;
  late String loanDate;
  late String receiveAmountStr;
  late String feeAmountStr;
  late String verificationFeeStr;
  late String gstFeeStr;
  late String interestAmountStr;
  late String overdueChargeStr;
  late String repayAmountStr;

  ProductDetailModel();

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => $ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => $ProductDetailModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
