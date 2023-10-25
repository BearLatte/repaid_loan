import 'package:get/get.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';

import '../models/feedback_model.dart';

class FeedbackListController extends GetxController {
  List<FeedbackModel> feedbacks = [];

  @override
  void onInit() {
    fetchFeedbackList();
    super.onInit();
  }

  void fetchFeedbackList() async {
    feedbacks = await ApiUtil.fetchFeedbackList();
    update();
  }

  void addFeedbackBtnOnPressed() => Get.toNamed(Routes.configFeedback)?.then((_) => fetchFeedbackList());

  void feedbackItemOnTap(FeedbackModel feedback) async {
    Get.toNamed(Routes.feedbackDetail, arguments: feedback);
  }
}
