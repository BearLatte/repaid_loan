import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/modify_bank_info_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/views/authentication/form_item_view.dart';
import 'package:repaid_loan/widgets/hidden_keyboard_wraper.dart';

class ModifyBankInfoView extends StatelessWidget {
  const ModifyBankInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return HiddenKeyboardWrapper(
      child: BaseView(
        title: 'Bank Account',
        extendBodyBehindAppBar: true,
        background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
        body: SafeArea(
          bottom: false,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              child: GetBuilder<ModifyBankInfoController>(
                builder: (controller) => Column(
                  children: [
                    Container(padding: const EdgeInsets.only(top: 45, bottom: 30), child: const CommonImage(src: 'assets/images/change_bank_img.png')),
                    FormItemView(title: 'Bank Name', inputController: controller.bankNameController),
                    FormItemView(title: 'Account Number', inputController: controller.numberController),
                    FormItemView(title: 'IFSC Code', inputController: controller.ifscController),
                    Container(
                      height: 54,
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.only(top: 65, left: 30, right: 30, bottom: 35),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(onPressed: controller.submitBtnOnPressed, child: const Text('Submit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
