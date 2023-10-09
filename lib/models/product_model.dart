import 'dart:convert';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/product_model.g.dart';

export 'package:repaid_loan/generated/json/product_model.g.dart';

@JsonSerializable()
class ProductModel {
  late String id;
  late String spaceName;
  late String logo;
  late String loanName;
  late String loanDate;
  late String loanAmount;
  late String loanRate;
  late int dailyApplyNum;
  late int newUserState;
  late int oldUserState;

  String get fullAmountContent => 'INR $loanAmount';

  String get fullRateContent => 'Fee $loanRate / day';

  ProductModel();

  factory ProductModel.fromJson(Map<String, dynamic> json) => $ProductModelFromJson(json);

  Map<String, dynamic> toJson() => $ProductModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
