import 'package:repaid_loan/generated/json/base/json_convert_content.dart';
import 'package:repaid_loan/models/product_detail_model.dart';

ProductDetailModel $ProductDetailModelFromJson(Map<String, dynamic> json) {
  final ProductDetailModel productDetailModel = ProductDetailModel();
  final String? logo = jsonConvert.convert<String>(json['logo']);
  if (logo != null) {
    productDetailModel.logo = logo;
  }
  final String? spaceName = jsonConvert.convert<String>(json['spaceName']);
  if (spaceName != null) {
    productDetailModel.spaceName = spaceName;
  }
  final String? productId = jsonConvert.convert<String>(json['productId']);
  if (productId != null) {
    productDetailModel.productId = productId;
  }
  final String? loanAmountStr = jsonConvert.convert<String>(json['loanAmountStr']);
  if (loanAmountStr != null) {
    productDetailModel.loanAmountStr = loanAmountStr;
  }
  final String? loanDate = jsonConvert.convert<String>(json['loanDate']);
  if (loanDate != null) {
    productDetailModel.loanDate = loanDate;
  }
  final String? receiveAmountStr = jsonConvert.convert<String>(json['receiveAmountStr']);
  if (receiveAmountStr != null) {
    productDetailModel.receiveAmountStr = receiveAmountStr;
  }
  final String? feeAmountStr = jsonConvert.convert<String>(json['feeAmountStr']);
  if (feeAmountStr != null) {
    productDetailModel.feeAmountStr = feeAmountStr;
  }
  final String? verificationFeeStr = jsonConvert.convert<String>(json['verificationFeeStr']);
  if (verificationFeeStr != null) {
    productDetailModel.verificationFeeStr = verificationFeeStr;
  }
  final String? gstFeeStr = jsonConvert.convert<String>(json['gstFeeStr']);
  if (gstFeeStr != null) {
    productDetailModel.gstFeeStr = gstFeeStr;
  }
  final String? interestAmountStr = jsonConvert.convert<String>(json['interestAmountStr']);
  if (interestAmountStr != null) {
    productDetailModel.interestAmountStr = interestAmountStr;
  }
  final String? overdueChargeStr = jsonConvert.convert<String>(json['overdueChargeStr']);
  if (overdueChargeStr != null) {
    productDetailModel.overdueChargeStr = overdueChargeStr;
  }
  final String? repayAmountStr = jsonConvert.convert<String>(json['repayAmountStr']);
  if (repayAmountStr != null) {
    productDetailModel.repayAmountStr = repayAmountStr;
  }
  return productDetailModel;
}

Map<String, dynamic> $ProductDetailModelToJson(ProductDetailModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['logo'] = entity.logo;
  data['spaceName'] = entity.spaceName;
  data['productId'] = entity.productId;
  data['loanAmountStr'] = entity.loanAmountStr;
  data['loanDate'] = entity.loanDate;
  data['receiveAmountStr'] = entity.receiveAmountStr;
  data['feeAmountStr'] = entity.feeAmountStr;
  data['verificationFeeStr'] = entity.verificationFeeStr;
  data['gstFeeStr'] = entity.gstFeeStr;
  data['interestAmountStr'] = entity.interestAmountStr;
  data['overdueChargeStr'] = entity.overdueChargeStr;
  data['repayAmountStr'] = entity.repayAmountStr;
  return data;
}

extension ProductDetailModelExtension on ProductDetailModel {
  ProductDetailModel copyWith({
    String? logo,
    String? spaceName,
    String? productId,
    String? loanAmountStr,
    String? loanDate,
    String? receiveAmountStr,
    String? feeAmountStr,
    String? verificationFeeStr,
    String? gstFeeStr,
    String? interestAmountStr,
    String? overdueChargeStr,
    String? repayAmountStr,
  }) {
    return ProductDetailModel()
      ..logo = logo ?? this.logo
      ..spaceName = spaceName ?? this.spaceName
      ..productId = productId ?? this.productId
      ..loanAmountStr = loanAmountStr ?? this.loanAmountStr
      ..loanDate = loanDate ?? this.loanDate
      ..receiveAmountStr = receiveAmountStr ?? this.receiveAmountStr
      ..feeAmountStr = feeAmountStr ?? this.feeAmountStr
      ..verificationFeeStr = verificationFeeStr ?? this.verificationFeeStr
      ..gstFeeStr = gstFeeStr ?? this.gstFeeStr
      ..interestAmountStr = interestAmountStr ?? this.interestAmountStr
      ..overdueChargeStr = overdueChargeStr ?? this.overdueChargeStr
      ..repayAmountStr = repayAmountStr ?? this.repayAmountStr;
  }
}
