import 'package:repaid_loan/generated/json/base/json_convert_content.dart';
import 'package:repaid_loan/models/order_model.dart';

OrderModel $OrderModelFromJson(Map<String, dynamic> json) {
  final OrderModel orderModel = OrderModel();
  final String? bankCardNo = jsonConvert.convert<String>(json['bankCardNo']);
  if (bankCardNo != null) {
    orderModel.bankCardNo = bankCardNo;
  }
  final String? logo = jsonConvert.convert<String>(json['logo']);
  if (logo != null) {
    orderModel.logo = logo;
  }
  final String? loanName = jsonConvert.convert<String>(json['loanName']);
  if (loanName != null) {
    orderModel.loanName = loanName;
  }
  final String? productId = jsonConvert.convert<String>(json['productId']);
  if (productId != null) {
    orderModel.productId = productId;
  }
  final String? loanOrderNo = jsonConvert.convert<String>(json['loanOrderNo']);
  if (loanOrderNo != null) {
    orderModel.loanOrderNo = loanOrderNo;
  }
  final String? applyDateStr = jsonConvert.convert<String>(json['applyDateStr']);
  if (applyDateStr != null) {
    orderModel.applyDateStr = applyDateStr;
  }
  final String? loanAmountStr = jsonConvert.convert<String>(json['loanAmountStr']);
  if (loanAmountStr != null) {
    orderModel.loanAmountStr = loanAmountStr;
  }
  final int? loanDate = jsonConvert.convert<int>(json['loanDate']);
  if (loanDate != null) {
    orderModel.loanDate = loanDate;
  }
  final String? receiveAmountStr = jsonConvert.convert<String>(json['receiveAmountStr']);
  if (receiveAmountStr != null) {
    orderModel.receiveAmountStr = receiveAmountStr;
  }
  final String? repayAmountStr = jsonConvert.convert<String>(json['repayAmountStr']);
  if (repayAmountStr != null) {
    orderModel.repayAmountStr = repayAmountStr;
  }
  final String? repayDateStr = jsonConvert.convert<String>(json['repayDateStr']);
  if (repayDateStr != null) {
    orderModel.repayDateStr = repayDateStr;
  }
  final int? overDueDays = jsonConvert.convert<int>(json['overDueDays']);
  if (overDueDays != null) {
    orderModel.overDueDays = overDueDays;
  }
  final String? overDueFeeStr = jsonConvert.convert<String>(json['overDueFeeStr']);
  if (overDueFeeStr != null) {
    orderModel.overDueFeeStr = overDueFeeStr;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderModel.status = status;
  }
  final String? receiveDateStr = jsonConvert.convert<String>(json['receiveDateStr']);
  if (receiveDateStr != null) {
    orderModel.receiveDateStr = receiveDateStr;
  }
  final int? daysToRepay = jsonConvert.convert<int>(json['daysToRepay']);
  if (daysToRepay != null) {
    orderModel.daysToRepay = daysToRepay;
  }
  return orderModel;
}

Map<String, dynamic> $OrderModelToJson(OrderModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bankCardNo'] = entity.bankCardNo;
  data['logo'] = entity.logo;
  data['loanName'] = entity.loanName;
  data['productId'] = entity.productId;
  data['loanOrderNo'] = entity.loanOrderNo;
  data['applyDateStr'] = entity.applyDateStr;
  data['loanAmountStr'] = entity.loanAmountStr;
  data['loanDate'] = entity.loanDate;
  data['receiveAmountStr'] = entity.receiveAmountStr;
  data['repayAmountStr'] = entity.repayAmountStr;
  data['repayDateStr'] = entity.repayDateStr;
  data['overDueDays'] = entity.overDueDays;
  data['overDueFeeStr'] = entity.overDueFeeStr;
  data['status'] = entity.status;
  data['receiveDateStr'] = entity.receiveDateStr;
  data['daysToRepay'] = entity.daysToRepay;
  return data;
}

extension OrderModelExtension on OrderModel {
  OrderModel copyWith({
    String? bankCardNo,
    String? logo,
    String? loanName,
    String? productId,
    String? loanOrderNo,
    String? applyDateStr,
    String? loanAmountStr,
    int? loanDate,
    String? receiveAmountStr,
    String? repayAmountStr,
    String? repayDateStr,
    int? overDueDays,
    String? overDueFeeStr,
    int? status,
    String? receiveDateStr,
    int? daysToRepay,
  }) {
    return OrderModel()
      ..bankCardNo = bankCardNo ?? this.bankCardNo
      ..logo = logo ?? this.logo
      ..loanName = loanName ?? this.loanName
      ..productId = productId ?? this.productId
      ..loanOrderNo = loanOrderNo ?? this.loanOrderNo
      ..applyDateStr = applyDateStr ?? this.applyDateStr
      ..loanAmountStr = loanAmountStr ?? this.loanAmountStr
      ..loanDate = loanDate ?? this.loanDate
      ..receiveAmountStr = receiveAmountStr ?? this.receiveAmountStr
      ..repayAmountStr = repayAmountStr ?? this.repayAmountStr
      ..repayDateStr = repayDateStr ?? this.repayDateStr
      ..overDueDays = overDueDays ?? this.overDueDays
      ..overDueFeeStr = overDueFeeStr ?? this.overDueFeeStr
      ..status = status ?? this.status
      ..receiveDateStr = receiveDateStr ?? this.receiveDateStr
      ..daysToRepay = daysToRepay ?? this.daysToRepay;
  }
}
