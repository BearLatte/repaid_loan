import 'dart:convert';

import 'package:repaid_loan/generated/json/base/json_field.dart';
import 'package:repaid_loan/generated/json/feedback_model.g.dart';

export 'package:repaid_loan/generated/json/feedback_model.g.dart';

@JsonSerializable()
class FeedbackModel {
  late String phone;
  late String logo;
  late String loanName;
  late String feedBackType;
  late String feedBackContent;
  String? feedBackImg;
  String? feedBackReply;
  String? replyTime;
  late int replyNum;
  late String createTime;

  FeedbackModel();

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => $FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => $FeedbackModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
