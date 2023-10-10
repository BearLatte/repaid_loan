import 'package:repaid_loan/generated/json/base/json_convert_content.dart';
import 'package:repaid_loan/models/cont_model.dart';
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
  final List<ProductModel>? loanProductList = (json['loanProductList'] as List<dynamic>?)?.map((e) => jsonConvert.convert<ProductModel>(e) as ProductModel).toList();
  if (loanProductList != null) {
    contModel.loanProductList = loanProductList;
  }
  return contModel;
}

Map<String, dynamic> $ContModelToJson(ContModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uid'] = entity.uid;
  data['token'] = entity.token;
  data['isLogin'] = entity.isLogin;
  data['userStatus'] = entity.userStatus;
  data['loanProductList'] = entity.loanProductList.map((v) => v.toJson()).toList();
  return data;
}

extension ContModelExtension on ContModel {
  ContModel copyWith({
    String? uid,
    String? token,
    int? isLogin,
    int? userStatus,
    List<ProductModel>? loanProductList,
  }) {
    return ContModel()
      ..uid = uid ?? this.uid
      ..token = token ?? this.token
      ..isLogin = isLogin ?? this.isLogin
      ..userStatus = userStatus ?? this.userStatus
      ..loanProductList = loanProductList ?? this.loanProductList;
  }
}
