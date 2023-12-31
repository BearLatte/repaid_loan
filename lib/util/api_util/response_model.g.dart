import 'package:repaid_loan/generated/json/base/json_convert_content.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/util/api_util/response_model.dart';

ResponseModel<T> $ResponseModelFromJson<T>(Map<String, dynamic> json) {
  final ResponseModel<T> responseModel = ResponseModel();
  final ContModel? cont = jsonConvert.convert<ContModel>(json['cont']);
  if (cont != null) {
    responseModel.cont = cont;
  }
  final List<T>? list = (json['list'] as List<dynamic>?)?.map((e) => jsonConvert.convert<T>(e) as T).toList();
  if (list != null) {
    responseModel.list = list;
  }
  return responseModel;
}

Map<String, dynamic> $ResponseModelToJson(ResponseModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cont'] = entity.cont?.toJson();
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension ResponseModelExtension<T> on ResponseModel {
  ResponseModel copyWith({
    ContModel? cont,
    List<T>? list,
  }) {
    return ResponseModel()
      ..cont = cont ?? this.cont
      ..list = list ?? this.list;
  }
}
