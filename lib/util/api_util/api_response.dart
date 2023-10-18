import 'dart:convert';

import 'package:repaid_loan/generated/json/api_response.g.dart';
import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/util/api_util/response_model.dart';

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
