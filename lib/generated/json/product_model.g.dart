import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/util/api_util//json_convert_content.dart';

ProductModel $ProductModelFromJson(Map<String, dynamic> json) {
  final ProductModel productModel = ProductModel();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    productModel.id = id;
  }
  final String? spaceName = jsonConvert.convert<String>(json['spaceName']);
  if (spaceName != null) {
    productModel.spaceName = spaceName;
  }
  final String? logo = jsonConvert.convert<String>(json['logo']);
  if (logo != null) {
    productModel.logo = logo;
  }
  final String? loanName = jsonConvert.convert<String>(json['loanName']);
  if (loanName != null) {
    productModel.loanName = loanName;
  }
  final String? loanDate = jsonConvert.convert<String>(json['loanDate']);
  if (loanDate != null) {
    productModel.loanDate = loanDate;
  }
  final String? loanAmount = jsonConvert.convert<String>(json['loanAmount']);
  if (loanAmount != null) {
    productModel.loanAmount = loanAmount;
  }
  final String? loanRate = jsonConvert.convert<String>(json['loanRate']);
  if (loanRate != null) {
    productModel.loanRate = loanRate;
  }
  final int? dailyApplyNum = jsonConvert.convert<int>(json['dailyApplyNum']);
  if (dailyApplyNum != null) {
    productModel.dailyApplyNum = dailyApplyNum;
  }
  final int? newUserState = jsonConvert.convert<int>(json['newUserState']);
  if (newUserState != null) {
    productModel.newUserState = newUserState;
  }
  final int? oldUserState = jsonConvert.convert<int>(json['oldUserState']);
  if (oldUserState != null) {
    productModel.oldUserState = oldUserState;
  }
  return productModel;
}

Map<String, dynamic> $ProductModelToJson(ProductModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['spaceName'] = entity.spaceName;
  data['logo'] = entity.logo;
  data['loanName'] = entity.loanName;
  data['loanDate'] = entity.loanDate;
  data['loanAmount'] = entity.loanAmount;
  data['loanRate'] = entity.loanRate;
  data['dailyApplyNum'] = entity.dailyApplyNum;
  data['newUserState'] = entity.newUserState;
  data['oldUserState'] = entity.oldUserState;
  return data;
}

extension ProductModelExtension on ProductModel {
  ProductModel copyWith({
    String? id,
    String? spaceName,
    String? logo,
    String? loanName,
    String? loanDate,
    String? loanAmount,
    String? loanRate,
    int? dailyApplyNum,
    int? newUserState,
    int? oldUserState,
  }) {
    return ProductModel()
      ..id = id ?? this.id
      ..spaceName = spaceName ?? this.spaceName
      ..logo = logo ?? this.logo
      ..loanName = loanName ?? this.loanName
      ..loanDate = loanDate ?? this.loanDate
      ..loanAmount = loanAmount ?? this.loanAmount
      ..loanRate = loanRate ?? this.loanRate
      ..dailyApplyNum = dailyApplyNum ?? this.dailyApplyNum
      ..newUserState = newUserState ?? this.newUserState
      ..oldUserState = oldUserState ?? this.oldUserState;
  }
}
