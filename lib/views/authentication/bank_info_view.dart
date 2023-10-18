import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/bank_info_controller.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/widgets/hidden_keyboard_wraper.dart';

class BankInfoView extends StatelessWidget {
  const BankInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Bank info',
      extendBodyBehindAppBar: true,
      isResizeToAvoidBottomInset: false,
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: HiddenKeyboardWrapper(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const CommonImage(src: 'assets/icons/progress_fourth_icon.png'),
              Expanded(
                child: GetBuilder<BankInfoController>(
                  builder: (controller) => Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                    child: Column(children: [
                      bankInfoItemView('Bank Name', inputController: controller.bankNameController),
                      bankInfoItemView('Account Number', inputController: controller.bankCardNumberController, keyboardType: TextInputType.number),
                      bankInfoItemView('IFSC Code', inputController: controller.ifscController),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        height: 54,
                        margin: const EdgeInsets.only(bottom: 35, left: 20, right: 20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          onPressed: controller.nextButtonOnPressed,
                          child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bankInfoItemView(String title, {TextEditingController? inputController, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(title, style: TextStyle(color: ColorsUtil.hexColor(0xa5a5a5), fontSize: 16)),
        ),
        TextField(
          controller: inputController,
          keyboardType: keyboardType,
          style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: title,
            prefix: const SizedBox(width: 10),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsUtil.hexColor(0xE1E3E8), width: 1)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsUtil.hexColor(0xE1E3E8), width: 1)),
            hintStyle: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
