import 'package:repaid_loan/models/credentials_model.dart';
import 'package:repaid_loan/util/api_util//json_convert_content.dart';

CredentialsModel $CredentialsModelFromJson(Map<String, dynamic> json) {
  final CredentialsModel credentialsModel = CredentialsModel();
  final String? securityToken = jsonConvert.convert<String>(json['securityToken']);
  if (securityToken != null) {
    credentialsModel.securityToken = securityToken;
  }
  final String? accessKeySecret = jsonConvert.convert<String>(json['accessKeySecret']);
  if (accessKeySecret != null) {
    credentialsModel.accessKeySecret = accessKeySecret;
  }
  final String? accessKeyId = jsonConvert.convert<String>(json['accessKeyId']);
  if (accessKeyId != null) {
    credentialsModel.accessKeyId = accessKeyId;
  }
  final String? expiration = jsonConvert.convert<String>(json['expiration']);
  if (expiration != null) {
    credentialsModel.expiration = expiration;
  }
  return credentialsModel;
}

Map<String, dynamic> $CredentialsModelToJson(CredentialsModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['securityToken'] = entity.securityToken;
  data['accessKeySecret'] = entity.accessKeySecret;
  data['accessKeyId'] = entity.accessKeyId;
  data['expiration'] = entity.expiration;
  return data;
}

extension CredentialsModelExtension on CredentialsModel {
  CredentialsModel copyWith({
    String? securityToken,
    String? accessKeySecret,
    String? accessKeyId,
    String? expiration,
  }) {
    return CredentialsModel()
      ..securityToken = securityToken ?? this.securityToken
      ..accessKeySecret = accessKeySecret ?? this.accessKeySecret
      ..accessKeyId = accessKeyId ?? this.accessKeyId
      ..expiration = expiration ?? this.expiration;
  }
}
