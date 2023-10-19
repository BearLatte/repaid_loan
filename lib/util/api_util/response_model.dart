import 'dart:convert';

import 'package:repaid_loan/models/cont_model.dart';

import 'response_model.g.dart';

export 'package:repaid_loan/util/api_util/response_model.g.dart';

class ResponseModel<T> {
  ContModel? cont;
  List<T>? list;

  ResponseModel();

  factory ResponseModel.fromJson(Map<String, dynamic> json) => $ResponseModelFromJson<T>(json);

  Map<String, dynamic> toJson() => $ResponseModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
