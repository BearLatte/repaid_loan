import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/feedback_list_controller.dart';
import 'package:repaid_loan/models/feedback_model.dart';
import 'package:repaid_loan/util/colors_util.dart';

class FeedbackListView extends StatelessWidget {
  const FeedbackListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'My feedback',
      extendBodyBehindAppBar: true,
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: const Text('Click the button below to submit your feedback.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: GetBuilder<FeedbackListController>(builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: controller.addFeedbackBtnOnPressed,
                      icon: const CommonImage(src: 'assets/icons/feedback_add_icon.png'),
                    ),
                    Expanded(child: feedbackListContentView(controller))
                  ],
                );
              }),
            ),
          )
        ]),
      ),
    );
  }

  Widget feedbackListContentView(FeedbackListController controller) {
    if (controller.feedbacks.isEmpty) {
      return Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: const CommonImage(src: 'assets/images/feedback_empty_img.png'),
          ),
          const Text(
            'Please describe your problems and suggestions. we will solve them in time.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer()
        ],
      );
    } else {
      return ListView(
        padding: const EdgeInsets.only(top: 30),
        children: controller.feedbacks.map((feedback) => feedbackItem(feedback, onTap: () => controller.feedbackItemOnTap(feedback))).toList(),
      );
    }
  }

  Widget feedbackItem(FeedbackModel feedback, {Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Text(feedback.feedBackType, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            if (feedback.replyNum > 0)
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: ColorsUtil.hexColor(0x00AD8E), borderRadius: BorderRadius.circular(11)),
                child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            Container(padding: const EdgeInsets.only(left: 30), child: Text(feedback.createTime, style: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 12)))
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 6, bottom: 40),
          child: Text(feedback.feedBackContent, style: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 14)),
        )
      ]),
    );
  }
}
