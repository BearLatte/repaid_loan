import 'package:repaid_loan/generated/json/base/json_convert_content.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/credentials_model.dart';
import 'package:repaid_loan/models/product_detail_model.dart';
import 'package:repaid_loan/models/product_model.dart';

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
  final String? panNumber = jsonConvert.convert<String>(json['panNumber']);
  if (panNumber != null) {
    contModel.panNumber = panNumber;
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
  return contModel;
}

Map<String, dynamic> $ContModelToJson(ContModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uid'] = entity.uid;
  data['token'] = entity.token;
  data['isLogin'] = entity.isLogin;
  data['userStatus'] = entity.userStatus;
  data['url'] = entity.url;
  data['region'] = entity.region;
  data['bucket'] = entity.bucket;
  data['credentials'] = entity.credentials?.toJson();
  data['frontImg'] = entity.frontImg;
  data['backImg'] = entity.backImg;
  data['aadharNumber'] = entity.aadharNumber;
  data['aadharName'] = entity.aadharName;
  data['dateOfBirth'] = entity.dateOfBirth;
  data['gender'] = entity.gender;
  data['addressAll'] = entity.addressAll;
  data['panNumber'] = entity.panNumber;
  data['firstName'] = entity.firstName;
  data['education'] = entity.education;
  data['marriageStatus'] = entity.marriageStatus;
  data['residenceDetailAddress'] = entity.residenceDetailAddress;
  data['eduList'] = entity.eduList;
  data['marryList'] = entity.marryList;
  data['industryList'] = entity.industryList;
  data['monthSalaryList'] = entity.monthSalaryList;
  data['jobList'] = entity.jobList;
  data['relationList'] = entity.relationList;
  data['loanProductList'] = entity.loanProductList?.map((v) => v.toJson()).toList();
  data['loanProductVo'] = entity.loanProductVo?.toJson();
  return data;
}

extension ContModelExtension on ContModel {
  ContModel copyWith({
    String? uid,
    String? token,
    int? isLogin,
    int? userStatus,
    String? url,
    String? region,
    String? bucket,
    CredentialsModel? credentials,
    String? frontImg,
    String? backImg,
    String? aadharNumber,
    String? aadharName,
    String? dateOfBirth,
    String? gender,
    String? addressAll,
    String? panNumber,
    String? firstName,
    String? education,
    String? marriageStatus,
    String? residenceDetailAddress,
    List<String>? eduList,
    List<String>? marryList,
    List<String>? industryList,
    List<String>? monthSalaryList,
    List<String>? jobList,
    List<String>? relationList,
    List<ProductModel>? loanProductList,
    ProductDetailModel? loanProductVo,
  }) {
    return ContModel()
      ..uid = uid ?? this.uid
      ..token = token ?? this.token
      ..isLogin = isLogin ?? this.isLogin
      ..userStatus = userStatus ?? this.userStatus
      ..url = url ?? this.url
      ..region = region ?? this.region
      ..bucket = bucket ?? this.bucket
      ..credentials = credentials ?? this.credentials
      ..frontImg = frontImg ?? this.frontImg
      ..backImg = backImg ?? this.backImg
      ..aadharNumber = aadharNumber ?? this.aadharNumber
      ..aadharName = aadharName ?? this.aadharName
      ..dateOfBirth = dateOfBirth ?? this.dateOfBirth
      ..gender = gender ?? this.gender
      ..addressAll = addressAll ?? this.addressAll
      ..panNumber = panNumber ?? this.panNumber
      ..firstName = firstName ?? this.firstName
      ..education = education ?? this.education
      ..marriageStatus = marriageStatus ?? this.marriageStatus
      ..residenceDetailAddress = residenceDetailAddress ?? this.residenceDetailAddress
      ..eduList = eduList ?? this.eduList
      ..marryList = marryList ?? this.marryList
      ..industryList = industryList ?? this.industryList
      ..monthSalaryList = monthSalaryList ?? this.monthSalaryList
      ..jobList = jobList ?? this.jobList
      ..relationList = relationList ?? this.relationList
      ..loanProductList = loanProductList ?? this.loanProductList
      ..loanProductVo = loanProductVo ?? this.loanProductVo;
  }
}
