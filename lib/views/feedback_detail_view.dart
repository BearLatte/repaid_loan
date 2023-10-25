import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/models/feedback_model.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/widgets/image_grid_view.dart';

import '../common/common_image.dart';

class FeedbackDetailView extends StatelessWidget {
  const FeedbackDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    FeedbackModel feedback = Get.arguments;
    List<String>? images;
    if (feedback.feedBackImg != null) {
      images = jsonDecode(feedback.feedBackImg!).cast<String>();
    }

    return BaseView(
      title: 'Detail',
      extendBodyBehindAppBar: true,
      background: Column(
        children: [Container(color: ColorsUtil.hexColor(0x00AD8E), height: 130), Container(color: ColorsUtil.hexColor(0xF0F2F5))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            if (feedback.replyNum > 0)
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorsUtil.hexColor(0xE6E6E6), width: 1),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 220,
                      child: Text(
                        feedback.feedBackReply!,
                        maxLines: null,
                        style: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 16),
                      ),
                    ),
                    Text(feedback.replyTime!, style: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 14))
                  ],
                ),
              ),
            Stack(children: [
              Column(children: [Container(color: ColorsUtil.hexColor(0x00AD8E), height: 180)]),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(children: [
                        Container(padding: const EdgeInsets.only(right: 12), child: ClipOval(child: CommonImage(src: feedback.logo, width: 40))),
                        Text(feedback.loanName, style: const TextStyle(color: Colors.white, fontSize: 20))
                      ]),
                      const Padding(padding: EdgeInsets.only(bottom: 8)),
                      Text(feedback.feedBackType, style: const TextStyle(color: Colors.white, fontSize: 16)),
                      const Padding(padding: EdgeInsets.only(bottom: 8)),
                      Text('Phone number : ${feedback.phone}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorsUtil.hexColor(0xE6E6E6)),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Text(feedback.feedBackContent, style: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 16)),
                      ),
                      if (images != null) ImageGridView(images: images!, isUpload: false),
                      Container(padding: const EdgeInsets.only(top: 10), child: Text(feedback.createTime, textAlign: TextAlign.center, style: TextStyle(color: ColorsUtil.hexColor(0x999999))))
                    ]),
                  ),
                ]),
              )
            ])
          ]),
        ),
      ),
    );
  }
}
