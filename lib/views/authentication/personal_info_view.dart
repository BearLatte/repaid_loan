import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/personal_info_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/views/authentication/form_item_view.dart';
import 'package:repaid_loan/views/authentication/ocr_choose_panel.dart';
import 'package:repaid_loan/widgets/hidden_keyboard_wraper.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Personal info',
      extendBodyBehindAppBar: true,
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: HiddenKeyboardWrapper(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CommonImage(src: 'assets/icons/progress_second_icon.png'),
              Expanded(
                child: GetBuilder<PersonalInfoController>(
                  builder: (controller) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          OCRChoosePanel(title: 'Pan card Front', simpleImg: controller.panCardImage, cameraBtnOnPressed: controller.panCardOnPressed),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 35),
                            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                            child: Column(
                              children: [
                                FormItemView(
                                  title: 'Pan Number',
                                  inputController: controller.panNumberController,
                                  onPressed: () => controller.cellItemOnPressed(FormItemType.panNumber),
                                ),
                                FormItemView(
                                  title: 'WhatsApp Account',
                                  keyboardType: TextInputType.number,
                                  inputController: controller.whatsAppController,
                                  onPressed: () => controller.cellItemOnPressed(FormItemType.whatApp),
                                ),
                                FormItemView(
                                  title: 'Industry',
                                  inputController: controller.industryController,
                                  cellType: CellType.selection,
                                  onPressed: () => controller.cellItemOnPressed(FormItemType.industry),
                                ),
                                FormItemView(
                                  title: 'Work Title',
                                  inputController: controller.workTitleController,
                                  cellType: CellType.selection,
                                  onPressed: () => controller.cellItemOnPressed(FormItemType.workTitle),
                                ),
                                FormItemView(
                                  title: 'Monthly Salary',
                                  inputController: controller.salaryController,
                                  cellType: CellType.selection,
                                  onPressed: () => controller.cellItemOnPressed(FormItemType.salary),
                                ),
                                FormItemView(
                                  title: 'E-mail',
                                  inputController: controller.emailController,
                                  onPressed: () => controller.cellItemOnPressed(FormItemType.email),
                                ),
                                FormItemView(
                                  title: 'Paytm Account （optional）',
                                  inputController: controller.paytmController,
                                  onPressed: () => controller.cellItemOnPressed(FormItemType.paytm),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 54,
                                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  child: ElevatedButton(
                                    onPressed: controller.nextBtnOnPressed,
                                    child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
