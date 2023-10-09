import 'package:repaid_loan/generated/json/base/json_convert_content.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/product_model.dart';

ContModel $ContModelFromJson(Map<String, dynamic> json) {
  final ContModel contModel = ContModel();
  final List<ProductModel>? loanProductList = (json['loanProductList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<ProductModel>(e) as ProductModel).toList();
  if (loanProductList != null) {
    contModel.loanProductList = loanProductList;
  }
  return contModel;
}

Map<String, dynamic> $ContModelToJson(ContModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['loanProductList'] = entity.loanProductList.map((v) => v.toJson()).toList();
  return data;
}

extension ContModelExtension on ContModel {
  ContModel copyWith({
    List<ProductModel>? loanProductList,
  }) {
    return ContModel()..loanProductList = loanProductList ?? this.loanProductList;
  }
}
