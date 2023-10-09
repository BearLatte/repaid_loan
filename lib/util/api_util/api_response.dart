import 'dart:convert';

import 'package:repaid_loan/generated/json/api_response.g.dart';
import 'package:repaid_loan/generated/json/base/json_field.dart';

import '../../models/cont_model.dart';

export 'package:repaid_loan/generated/json/api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  late int code;
  late String msg;
  late ResponseModel response;

  ApiResponse();

  factory ApiResponse.fromJson(Map<String, dynamic> json) => $ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ResponseModel {
  List<dynamic>? list;
  ContModel? cont;

  ResponseModel();

  factory ResponseModel.fromJson(Map<String, dynamic> json) => $ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => $ResponseModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
