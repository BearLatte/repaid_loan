import 'dart:convert';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/cont_model.g.dart';
import 'package:repaid_loan/models/pay_fail_info_model.dart';
import 'package:repaid_loan/models/product_detail_model.dart';
import 'package:repaid_loan/models/product_model.dart';

import 'credentials_model.dart';
import 'order_model.dart';

export 'package:repaid_loan/generated/json/cont_model.g.dart';

@JsonSerializable()
class ContModel {
  String? phone;
  String? uid;
  String? token;
  int? isLogin;
  int? userStatus;
  int? userLiveness;
  int? isFirstApply;
  int? userPayFail;
  int? frozenDays;
  int? isExtend;

  // OSS 图片上传相关
  String? url;
  String? region;
  String? bucket;
  CredentialsModel? credentials;

  // 还款路径
  String? path;
  String? h5;
  int? webview;

  int? isExtendIng;
  String? extendFee;
  int? extendDate;
  String? extendRepayDate;
  String? extendRepayAmount;

  // OCR 识别模型
  String? frontImg;
  String? backImg;
  String? panCardImg;
  String? aadharNumber;
  String? aadharName;
  String? dateOfBirth;
  String? gender;
  String? addressAll;
  String? firstName;
  String? education;
  String? marriageStatus;
  String? residenceDetailAddress;
  String? panNumber;
  // whatsapp 账号
  String? bodyImg;
  String? email;
  String? industry;
  String? monthlySalary;
  String? paytmAccount;
  String? job;
  String? familyNumber;
  String? familyName;
  String? colleagueNumber;
  String? colleagueName;
  String? brotherOrSisterNumber;
  String? brotherOrSisterName;
  String? bankName;
  String? bankCardNo;
  String? ifscCode;

  // 下拉列表项
  List<String>? eduList;
  List<String>? marryList;
  List<String>? industryList;
  List<String>? monthSalaryList;
  List<String>? jobList;
  List<String>? relationList;

  List<ProductModel>? loanProductList;
  ProductDetailModel? loanProductVo;
  PayFailInfoModel? userPayFailInfo;
  OrderModel? loanAuditOrderVo;
  List<String>? feedBackTypeList;

  ContModel();

  factory ContModel.fromJson(Map<String, dynamic> json) => $ContModelFromJson(json);

  Map<String, dynamic> toJson() => $ContModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
