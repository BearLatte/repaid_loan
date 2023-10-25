import 'package:repaid_loan/generated/json/base/json_convert_content.dart';
import 'package:repaid_loan/models/feedback_model.dart';

FeedbackModel $FeedbackModelFromJson(Map<String, dynamic> json) {
  final FeedbackModel feedbackModel = FeedbackModel();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    feedbackModel.phone = phone;
  }
  final String? logo = jsonConvert.convert<String>(json['logo']);
  if (logo != null) {
    feedbackModel.logo = logo;
  }
  final String? loanName = jsonConvert.convert<String>(json['loanName']);
  if (loanName != null) {
    feedbackModel.loanName = loanName;
  }
  final String? feedBackType = jsonConvert.convert<String>(json['feedBackType']);
  if (feedBackType != null) {
    feedbackModel.feedBackType = feedBackType;
  }
  final String? feedBackContent = jsonConvert.convert<String>(json['feedBackContent']);
  if (feedBackContent != null) {
    feedbackModel.feedBackContent = feedBackContent;
  }
  final String? feedBackImg = jsonConvert.convert<String>(json['feedBackImg']);
  if (feedBackImg != null) {
    feedbackModel.feedBackImg = feedBackImg;
  }
  final String? feedBackReply = jsonConvert.convert<String>(json['feedBackReply']);
  if (feedBackReply != null) {
    feedbackModel.feedBackReply = feedBackReply;
  }
  final String? replyTime = jsonConvert.convert<String>(json['replyTime']);
  if (replyTime != null) {
    feedbackModel.replyTime = replyTime;
  }
  final int? replyNum = jsonConvert.convert<int>(json['replyNum']);
  if (replyNum != null) {
    feedbackModel.replyNum = replyNum;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    feedbackModel.createTime = createTime;
  }
  return feedbackModel;
}

Map<String, dynamic> $FeedbackModelToJson(FeedbackModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['logo'] = entity.logo;
  data['loanName'] = entity.loanName;
  data['feedBackType'] = entity.feedBackType;
  data['feedBackContent'] = entity.feedBackContent;
  data['feedBackImg'] = entity.feedBackImg;
  data['feedBackReply'] = entity.feedBackReply;
  data['replyTime'] = entity.replyTime;
  data['replyNum'] = entity.replyNum;
  data['createTime'] = entity.createTime;
  return data;
}

extension FeedbackModelExtension on FeedbackModel {
  FeedbackModel copyWith({
    String? phone,
    String? logo,
    String? loanName,
    String? feedBackType,
    String? feedBackContent,
    String? feedBackImg,
    String? feedBackReply,
    String? replyTime,
    int? replyNum,
    String? createTime,
  }) {
    return FeedbackModel()
      ..phone = phone ?? this.phone
      ..logo = logo ?? this.logo
      ..loanName = loanName ?? this.loanName
      ..feedBackType = feedBackType ?? this.feedBackType
      ..feedBackContent = feedBackContent ?? this.feedBackContent
      ..feedBackImg = feedBackImg ?? this.feedBackImg
      ..feedBackReply = feedBackReply ?? this.feedBackReply
      ..replyTime = replyTime ?? this.replyTime
      ..replyNum = replyNum ?? this.replyNum
      ..createTime = createTime ?? this.createTime;
  }
}
