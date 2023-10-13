import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/kyc_verify_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/views/authentication/form_item_view.dart';
import 'package:repaid_loan/views/authentication/ocr_choose_panel.dart';
import 'package:repaid_loan/widgets/hidden_keyboard_wraper.dart';

class KYCVerifyView extends StatelessWidget {
  const KYCVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<KYCVerifyController>();
    return BaseView(
      title: 'KYC Info',
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      extendBodyBehindAppBar: true,
      body: GetBuilder<KYCVerifyController>(builder: (controller) {
        return HiddenKeyboardWrapper(
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CommonImage(src: 'assets/icons/progress_first_icon.png'),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        OCRChoosePanel(title: 'Aadhaar Card Front', simpleImg: controller.kycFrontImage, cameraBtnOnPressed: controller.fontCardOnPressed),
                        OCRChoosePanel(title: 'Aadhaar Card Back', simpleImg: controller.kycBackImage, cameraBtnOnPressed: controller.backCardOnPressed),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FormItemView(
                                title: 'Aadhaar Name',
                                inputController: controller.nameController,
                                onPressed: () => controller.formItemOnPressed(FormItemType.aadhaarName),
                              ),
                              FormItemView(
                                title: 'Aadhaar Number',
                                inputController: controller.numberController,
                                onPressed: () => controller.formItemOnPressed(FormItemType.aadhaarNumber),
                              ),
                              genderItem(controller.currentGender, valueChanged: controller.genderChanged),
                              FormItemView(
                                title: 'Date of Birth',
                                cellType: CellType.selection,
                                inputController: controller.birthController,
                                onPressed: () => controller.formItemOnPressed(FormItemType.birth),
                              ),
                              FormItemView(
                                title: 'Marriage Status',
                                cellType: CellType.selection,
                                inputController: controller.marriageController,
                                onPressed: () => controller.formItemOnPressed(FormItemType.marriage),
                              ),
                              FormItemView(
                                title: 'Education',
                                cellType: CellType.selection,
                                inputController: controller.educationController,
                                onPressed: () => controller.formItemOnPressed(FormItemType.education),
                              ),
                              FormItemView(
                                title: 'Detail Address',
                                inputController: controller.addressController,
                                isMultiLines: true,
                                onPressed: () => controller.formItemOnPressed(FormItemType.address),
                              ),
                              Container(
                                height: 54,
                                clipBehavior: Clip.hardEdge,
                                margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: ElevatedButton(
                                  onPressed: controller.nextOnPressed,
                                  child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget genderItem(Gender gender, {required Function(Gender gender) valueChanged}) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text('Gender', style: TextStyle(color: ColorsUtil.hexColor(0xa5a5a5), fontSize: 16)),
        ),
        Row(children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => valueChanged(Gender.male),
              child: Container(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: gender == Gender.male ? ColorsUtil.hexColor(0x00AD8E) : ColorsUtil.hexColor(0x999999), width: 1.0),
                  ),
                ),
                child: Text(
                  'male',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: gender == Gender.male ? ColorsUtil.hexColor(0x00AD8E) : ColorsUtil.hexColor(0x999999),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: InkWell(
              onTap: () => valueChanged(Gender.female),
              child: Container(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: gender == Gender.female ? ColorsUtil.hexColor(0x00AD8E) : ColorsUtil.hexColor(0x999999), width: 1.0),
                  ),
                ),
                child: Text(
                  'female',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: gender == Gender.female ? ColorsUtil.hexColor(0x00AD8E) : ColorsUtil.hexColor(0x999999),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
