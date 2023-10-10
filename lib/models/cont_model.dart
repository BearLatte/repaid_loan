import 'dart:convert';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/cont_model.g.dart';
import 'package:repaid_loan/models/product_detail_model.dart';
import 'package:repaid_loan/models/product_model.dart';

export 'package:repaid_loan/generated/json/cont_model.g.dart';

@JsonSerializable()
class ContModel {
  late String uid;
  late String token;
  late int isLogin;
  late int userStatus;

  late List<ProductModel> loanProductList;
  late ProductDetailModel loanProductVo;

  ContModel();

  factory ContModel.fromJson(Map<String, dynamic> json) => $ContModelFromJson(json);

  Map<String, dynamic> toJson() => $ContModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
