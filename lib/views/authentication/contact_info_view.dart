import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/contact_info_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/views/authentication/contact_item_view.dart';
import 'package:repaid_loan/widgets/hidden_keyboard_wraper.dart';

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return HiddenKeyboardWrapper(
      child: BaseView(
        extendBodyBehindAppBar: true,
        title: 'Contact info',
        background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CommonImage(src: 'assets/icons/progress_third_icon.png'),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 35),
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: GetBuilder<ContactInfoController>(
                      builder: (controller) => Column(
                        children: [
                          ContactItemView(
                            relation: 'Parents Contact',
                            phoneOnPressed: () => controller.phoneIconOnPressed('parents'),
                            nameController: controller.parentNameController,
                            numberController: controller.parentNumberController,
                            numberEnable: controller.isNumberEnable,
                            nameOnPressed: () => controller.nameOnPressed('parents'),
                          ),
                          ContactItemView(
                            relation: 'Family Contact',
                            phoneOnPressed: () => controller.phoneIconOnPressed('family'),
                            nameController: controller.familyNameController,
                            numberController: controller.familyNumberController,
                            numberEnable: controller.isNumberEnable,
                            nameOnPressed: () => controller.nameOnPressed('family'),
                          ),
                          ContactItemView(
                            relation: 'Colleague Contact',
                            phoneOnPressed: () => controller.phoneIconOnPressed('colleague'),
                            nameController: controller.colleagueNameController,
                            numberController: controller.colleagueNumberController,
                            numberEnable: controller.isNumberEnable,
                            nameOnPressed: () => controller.nameOnPressed('colleague'),
                          ),
                          Container(
                            height: 54,
                            width: double.infinity,
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                              onPressed: controller.nextBtnOnPressed,
                              child: const Text('Next', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
