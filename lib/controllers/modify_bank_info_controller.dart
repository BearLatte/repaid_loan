import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/models/bank_info_model.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/util/api_util/index.dart';

class ModifyBankInfoController extends GetxController {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();

  @override
  void onInit() {
    fetchAuthenticatedInfo();
    super.onInit();
  }

  void fetchAuthenticatedInfo() async {
    ContModel cont = await ApiUtil.fetchUserAuthenticationInfo(step: 'loanapiUserBankCard');
    bankNameController.text = cont.bankName ?? '';
    numberController.text = cont.bankCardNo ?? '';
    ifscController.text = cont.ifscCode ?? '';
  }

  void submitBtnOnPressed() async {
    if (bankNameController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Bank Name can not be empty.');
    if (numberController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Account Number can not be empty.');
    if (ifscController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('IFSC Code can not be empty.');

    final bankInfo = BankInfoModel(
      bankName: bankNameController.text,
      bankCardNo: numberController.text,
      ifscCode: ifscController.text,
    );

    await ApiUtil.bankInfoAuthenticate(bankInfo);
    // CommonSnackBar.showSnackBar('Modify Success', type: SnackType.success);
    await EasyLoading.showSuccess(
      'Success',
      duration: const Duration(seconds: 2),
      maskType: EasyLoadingMaskType.black,
    );
    Get.back();
  }
}
