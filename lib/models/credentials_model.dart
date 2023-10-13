import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/credentials_model.g.dart';
import 'dart:convert';
export 'package:repaid_loan/generated/json/credentials_model.g.dart';

@JsonSerializable()
class CredentialsModel {
  late String securityToken;
  late String accessKeySecret;
  late String accessKeyId;
  late String expiration;

  CredentialsModel();

  factory CredentialsModel.fromJson(Map<String, dynamic> json) => $CredentialsModelFromJson(json);

  Map<String, dynamic> toJson() => $CredentialsModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
