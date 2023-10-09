import 'dart:convert';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/cont_model.g.dart';
import 'package:repaid_loan/models/product_model.dart';

export 'package:repaid_loan/generated/json/cont_model.g.dart';

@JsonSerializable()
class ContModel {
  late List<ProductModel> loanProductList;

  ContModel();

  factory ContModel.fromJson(Map<String, dynamic> json) => $ContModelFromJson(json);

  Map<String, dynamic> toJson() => $ContModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
