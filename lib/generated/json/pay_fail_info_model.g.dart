import 'package:repaid_loan/models/pay_fail_info_model.dart';
import 'package:repaid_loan/util/api_util//json_convert_content.dart';

PayFailInfoModel $PayFailInfoModelFromJson(Map<String, dynamic> json) {
  final PayFailInfoModel payFailInfoModel = PayFailInfoModel();
  final String? loanOrderNo = jsonConvert.convert<String>(json['loanOrderNo']);
  if (loanOrderNo != null) {
    payFailInfoModel.loanOrderNo = loanOrderNo;
  }
  final String? loanName = jsonConvert.convert<String>(json['loanName']);
  if (loanName != null) {
    payFailInfoModel.loanName = loanName;
  }
  final String? logo = jsonConvert.convert<String>(json['logo']);
  if (logo != null) {
    payFailInfoModel.logo = logo;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    payFailInfoModel.content = content;
  }
  return payFailInfoModel;
}

Map<String, dynamic> $PayFailInfoModelToJson(PayFailInfoModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['loanOrderNo'] = entity.loanOrderNo;
  data['loanName'] = entity.loanName;
  data['logo'] = entity.logo;
  data['content'] = entity.content;
  return data;
}

extension PayFailInfoModelExtension on PayFailInfoModel {
  PayFailInfoModel copyWith({
    String? loanOrderNo,
    String? loanName,
    String? logo,
    String? content,
  }) {
    return PayFailInfoModel()
      ..loanOrderNo = loanOrderNo ?? this.loanOrderNo
      ..loanName = loanName ?? this.loanName
      ..logo = logo ?? this.logo
      ..content = content ?? this.content;
  }
}
