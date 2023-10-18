import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/pay_fail_info_model.dart';
import 'package:repaid_loan/models/product_detail_model.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/util/api_util/json_convert_content.dart';

import '../../models/credentials_model.dart';

ContModel $ContModelFromJson(Map<String, dynamic> json) {
  final ContModel contModel = ContModel();
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    contModel.uid = uid;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    contModel.token = token;
  }
  final int? isLogin = jsonConvert.convert<int>(json['isLogin']);
  if (isLogin != null) {
    contModel.isLogin = isLogin;
  }
  final int? userStatus = jsonConvert.convert<int>(json['userStatus']);
  if (userStatus != null) {
    contModel.userStatus = userStatus;
  }
  final int? userLiveness = jsonConvert.convert<int>(json['userLiveness']);
  if (userLiveness != null) {
    contModel.userLiveness = userLiveness;
  }
  final int? isFirstApply = jsonConvert.convert<int>(json['isFirstApply']);
  if (isFirstApply != null) {
    contModel.isFirstApply = isFirstApply;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    contModel.url = url;
  }
  final String? region = jsonConvert.convert<String>(json['region']);
  if (region != null) {
    contModel.region = region;
  }
  final String? bucket = jsonConvert.convert<String>(json['bucket']);
  if (bucket != null) {
    contModel.bucket = bucket;
  }
  final CredentialsModel? credentials = jsonConvert.convert<CredentialsModel>(json['credentials']);
  if (credentials != null) {
    contModel.credentials = credentials;
  }
  final String? frontImg = jsonConvert.convert<String>(json['frontImg']);
  if (frontImg != null) {
    contModel.frontImg = frontImg;
  }
  final String? backImg = jsonConvert.convert<String>(json['backImg']);
  if (backImg != null) {
    contModel.backImg = backImg;
  }
  final String? panCardImg = jsonConvert.convert<String>(json['panCardImg']);
  if (panCardImg != null) {
    contModel.panCardImg = panCardImg;
  }
  final String? aadharNumber = jsonConvert.convert<String>(json['aadharNumber']);
  if (aadharNumber != null) {
    contModel.aadharNumber = aadharNumber;
  }
  final String? aadharName = jsonConvert.convert<String>(json['aadharName']);
  if (aadharName != null) {
    contModel.aadharName = aadharName;
  }
  final String? dateOfBirth = jsonConvert.convert<String>(json['dateOfBirth']);
  if (dateOfBirth != null) {
    contModel.dateOfBirth = dateOfBirth;
  }
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    contModel.gender = gender;
  }
  final String? addressAll = jsonConvert.convert<String>(json['addressAll']);
  if (addressAll != null) {
    contModel.addressAll = addressAll;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    contModel.firstName = firstName;
  }
  final String? education = jsonConvert.convert<String>(json['education']);
  if (education != null) {
    contModel.education = education;
  }
  final String? marriageStatus = jsonConvert.convert<String>(json['marriageStatus']);
  if (marriageStatus != null) {
    contModel.marriageStatus = marriageStatus;
  }
  final String? residenceDetailAddress = jsonConvert.convert<String>(json['residenceDetailAddress']);
  if (residenceDetailAddress != null) {
    contModel.residenceDetailAddress = residenceDetailAddress;
  }
  final String? panNumber = jsonConvert.convert<String>(json['panNumber']);
  if (panNumber != null) {
    contModel.panNumber = panNumber;
  }
  final String? bodyImg = jsonConvert.convert<String>(json['bodyImg']);
  if (bodyImg != null) {
    contModel.bodyImg = bodyImg;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    contModel.email = email;
  }
  final String? industry = jsonConvert.convert<String>(json['industry']);
  if (industry != null) {
    contModel.industry = industry;
  }
  final String? monthlySalary = jsonConvert.convert<String>(json['monthlySalary']);
  if (monthlySalary != null) {
    contModel.monthlySalary = monthlySalary;
  }
  final String? paytmAccount = jsonConvert.convert<String>(json['paytmAccount']);
  if (paytmAccount != null) {
    contModel.paytmAccount = paytmAccount;
  }
  final String? job = jsonConvert.convert<String>(json['job']);
  if (job != null) {
    contModel.job = job;
  }
  final String? familyNumber = jsonConvert.convert<String>(json['familyNumber']);
  if (familyNumber != null) {
    contModel.familyNumber = familyNumber;
  }
  final String? familyName = jsonConvert.convert<String>(json['familyName']);
  if (familyName != null) {
    contModel.familyName = familyName;
  }
  final String? colleagueNumber = jsonConvert.convert<String>(json['colleagueNumber']);
  if (colleagueNumber != null) {
    contModel.colleagueNumber = colleagueNumber;
  }
  final String? colleagueName = jsonConvert.convert<String>(json['colleagueName']);
  if (colleagueName != null) {
    contModel.colleagueName = colleagueName;
  }
  final String? brotherOrSisterNumber = jsonConvert.convert<String>(json['brotherOrSisterNumber']);
  if (brotherOrSisterNumber != null) {
    contModel.brotherOrSisterNumber = brotherOrSisterNumber;
  }
  final String? brotherOrSisterName = jsonConvert.convert<String>(json['brotherOrSisterName']);
  if (brotherOrSisterName != null) {
    contModel.brotherOrSisterName = brotherOrSisterName;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    contModel.bankName = bankName;
  }
  final String? bankCardNo = jsonConvert.convert<String>(json['bankCardNo']);
  if (bankCardNo != null) {
    contModel.bankCardNo = bankCardNo;
  }
  final String? ifscCode = jsonConvert.convert<String>(json['ifscCode']);
  if (ifscCode != null) {
    contModel.ifscCode = ifscCode;
  }
  final List<String>? eduList = (json['eduList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (eduList != null) {
    contModel.eduList = eduList;
  }
  final List<String>? marryList = (json['marryList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (marryList != null) {
    contModel.marryList = marryList;
  }
  final List<String>? industryList = (json['industryList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (industryList != null) {
    contModel.industryList = industryList;
  }
  final List<String>? monthSalaryList = (json['monthSalaryList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (monthSalaryList != null) {
    contModel.monthSalaryList = monthSalaryList;
  }
  final List<String>? jobList = (json['jobList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (jobList != null) {
    contModel.jobList = jobList;
  }
  final List<String>? relationList = (json['relationList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (relationList != null) {
    contModel.relationList = relationList;
  }
  final List<ProductModel>? loanProductList = (json['loanProductList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<ProductModel>(e) as ProductModel).toList();
  if (loanProductList != null) {
    contModel.loanProductList = loanProductList;
  }
  final ProductDetailModel? loanProductVo = jsonConvert.convert<ProductDetailModel>(json['loanProductVo']);
  if (loanProductVo != null) {
    contModel.loanProductVo = loanProductVo;
  }
  final PayFailInfoModel? userPayFailInfo = jsonConvert.convert<PayFailInfoModel>(json['userPayFailInfo']);
  if (userPayFailInfo != null) {
    contModel.userPayFailInfo = userPayFailInfo;
  }
  return contModel;
}

Map<String, dynamic> $ContModelToJson(ContModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uid'] = entity.uid;
  data['token'] = entity.token;
  data['isLogin'] = entity.isLogin;
  data['userStatus'] = entity.userStatus;
  data['userLiveness'] = entity.userLiveness;
  data['isFirstApply'] = entity.isFirstApply;
  data['url'] = entity.url;
  data['region'] = entity.region;
  data['bucket'] = entity.bucket;
  data['credentials'] = entity.credentials?.toJson();
  data['frontImg'] = entity.frontImg;
  data['backImg'] = entity.backImg;
  data['panCardImg'] = entity.panCardImg;
  data['aadharNumber'] = entity.aadharNumber;
  data['aadharName'] = entity.aadharName;
  data['dateOfBirth'] = entity.dateOfBirth;
  data['gender'] = entity.gender;
  data['addressAll'] = entity.addressAll;
  data['firstName'] = entity.firstName;
  data['education'] = entity.education;
  data['marriageStatus'] = entity.marriageStatus;
  data['residenceDetailAddress'] = entity.residenceDetailAddress;
  data['panNumber'] = entity.panNumber;
  data['bodyImg'] = entity.bodyImg;
  data['email'] = entity.email;
  data['industry'] = entity.industry;
  data['monthlySalary'] = entity.monthlySalary;
  data['paytmAccount'] = entity.paytmAccount;
  data['job'] = entity.job;
  data['familyNumber'] = entity.familyNumber;
  data['familyName'] = entity.familyName;
  data['colleagueNumber'] = entity.colleagueNumber;
  data['colleagueName'] = entity.colleagueName;
  data['brotherOrSisterNumber'] = entity.brotherOrSisterNumber;
  data['brotherOrSisterName'] = entity.brotherOrSisterName;
  data['bankName'] = entity.bankName;
  data['bankCardNo'] = entity.bankCardNo;
  data['ifscCode'] = entity.ifscCode;
  data['eduList'] = entity.eduList;
  data['marryList'] = entity.marryList;
  data['industryList'] = entity.industryList;
  data['monthSalaryList'] = entity.monthSalaryList;
  data['jobList'] = entity.jobList;
  data['relationList'] = entity.relationList;
  data['loanProductList'] = entity.loanProductList?.map((v) => v.toJson()).toList();
  data['loanProductVo'] = entity.loanProductVo?.toJson();
  data['userPayFailInfo'] = entity.userPayFailInfo?.toJson();
  return data;
}

extension ContModelExtension on ContModel {
  ContModel copyWith({
    String? uid,
    String? token,
    int? isLogin,
    int? userStatus,
    int? userLiveness,
    int? isFirstApply,
    String? url,
    String? region,
    String? bucket,
    CredentialsModel? credentials,
    String? frontImg,
    String? backImg,
    String? panCardImg,
    String? aadharNumber,
    String? aadharName,
    String? dateOfBirth,
    String? gender,
    String? addressAll,
    String? firstName,
    String? education,
    String? marriageStatus,
    String? residenceDetailAddress,
    String? panNumber,
    String? bodyImg,
    String? email,
    String? industry,
    String? monthlySalary,
    String? paytmAccount,
    String? job,
    String? familyNumber,
    String? familyName,
    String? colleagueNumber,
    String? colleagueName,
    String? brotherOrSisterNumber,
    String? brotherOrSisterName,
    String? bankName,
    String? bankCardNo,
    String? ifscCode,
    List<String>? eduList,
    List<String>? marryList,
    List<String>? industryList,
    List<String>? monthSalaryList,
    List<String>? jobList,
    List<String>? relationList,
    List<ProductModel>? loanProductList,
    ProductDetailModel? loanProductVo,
    PayFailInfoModel? userPayFailInfo,
  }) {
    return ContModel()
      ..uid = uid ?? this.uid
      ..token = token ?? this.token
      ..isLogin = isLogin ?? this.isLogin
      ..userStatus = userStatus ?? this.userStatus
      ..userLiveness = userLiveness ?? this.userLiveness
      ..isFirstApply = isFirstApply ?? this.isFirstApply
      ..url = url ?? this.url
      ..region = region ?? this.region
      ..bucket = bucket ?? this.bucket
      ..credentials = credentials ?? this.credentials
      ..frontImg = frontImg ?? this.frontImg
      ..backImg = backImg ?? this.backImg
      ..panCardImg = panCardImg ?? this.panCardImg
      ..aadharNumber = aadharNumber ?? this.aadharNumber
      ..aadharName = aadharName ?? this.aadharName
      ..dateOfBirth = dateOfBirth ?? this.dateOfBirth
      ..gender = gender ?? this.gender
      ..addressAll = addressAll ?? this.addressAll
      ..firstName = firstName ?? this.firstName
      ..education = education ?? this.education
      ..marriageStatus = marriageStatus ?? this.marriageStatus
      ..residenceDetailAddress = residenceDetailAddress ?? this.residenceDetailAddress
      ..panNumber = panNumber ?? this.panNumber
      ..bodyImg = bodyImg ?? this.bodyImg
      ..email = email ?? this.email
      ..industry = industry ?? this.industry
      ..monthlySalary = monthlySalary ?? this.monthlySalary
      ..paytmAccount = paytmAccount ?? this.paytmAccount
      ..job = job ?? this.job
      ..familyNumber = familyNumber ?? this.familyNumber
      ..familyName = familyName ?? this.familyName
      ..colleagueNumber = colleagueNumber ?? this.colleagueNumber
      ..colleagueName = colleagueName ?? this.colleagueName
      ..brotherOrSisterNumber = brotherOrSisterNumber ?? this.brotherOrSisterNumber
      ..brotherOrSisterName = brotherOrSisterName ?? this.brotherOrSisterName
      ..bankName = bankName ?? this.bankName
      ..bankCardNo = bankCardNo ?? this.bankCardNo
      ..ifscCode = ifscCode ?? this.ifscCode
      ..eduList = eduList ?? this.eduList
      ..marryList = marryList ?? this.marryList
      ..industryList = industryList ?? this.industryList
      ..monthSalaryList = monthSalaryList ?? this.monthSalaryList
      ..jobList = jobList ?? this.jobList
      ..relationList = relationList ?? this.relationList
      ..loanProductList = loanProductList ?? this.loanProductList
      ..loanProductVo = loanProductVo ?? this.loanProductVo
      ..userPayFailInfo = userPayFailInfo ?? this.userPayFailInfo;
  }
}
