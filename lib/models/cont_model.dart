import 'dart:convert';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/cont_model.g.dart';
import 'package:repaid_loan/models/product_detail_model.dart';
import 'package:repaid_loan/models/product_model.dart';

import 'credentials_model.dart';

export 'package:repaid_loan/generated/json/cont_model.g.dart';

@JsonSerializable()
class ContModel {
  String? uid;
  String? token;
  int? isLogin;
  int? userStatus;

  // OSS 图片上传相关
  String? url;
  String? region;
  String? bucket;
  CredentialsModel? credentials;

  // OCR 识别模型
  String? frontImg;
  String? backImg;
  String? panCardImg;
  String? aadharNumber;
  String? aadharName;
  String? dateOfBirth;
  String? gender;
  String? addressAll;
  String? panNumber;
  String? firstName;
  String? education;
  String? marriageStatus;
  String? residenceDetailAddress;

  // 下拉列表项
  List<String>? eduList;
  List<String>? marryList;
  List<String>? industryList;
  List<String>? monthSalaryList;
  List<String>? jobList;
  List<String>? relationList;

  List<ProductModel>? loanProductList;
  ProductDetailModel? loanProductVo;

  ContModel();

  factory ContModel.fromJson(Map<String, dynamic> json) => $ContModelFromJson(json);

  Map<String, dynamic> toJson() => $ContModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
