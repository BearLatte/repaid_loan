import 'package:repaid_loan/generated/json/base/json_convert_content.dart';
import 'package:repaid_loan/util/api_util/api_response.dart';

ApiResponse $ApiResponseFromJson(Map<String, dynamic> json) {
  final ApiResponse apiResponse = ApiResponse();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    apiResponse.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    apiResponse.msg = msg;
  }
  final Map<String, dynamic>? response = (json['response'] as Map<String, dynamic>).map((k, e) => MapEntry(k, e));
  if (response != null) {
    apiResponse.response = response;
  }
  return apiResponse;
}

Map<String, dynamic> $ApiResponseToJson(ApiResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['response'] = entity.response;
  return data;
}

extension ApiResponseExtension on ApiResponse {
  ApiResponse copyWith({
    int? code,
    String? msg,
    Map<String, dynamic>? response,
  }) {
    return ApiResponse()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..response = response ?? this.response;
  }
}
