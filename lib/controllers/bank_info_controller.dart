import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/common_alert.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/models/bank_info_model.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';

class BankInfoController extends GetxController {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankCardNumberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();

  void nextButtonOnPressed() async {
    if (bankNameController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Bank Name can not be empty.');
    if (bankCardNumberController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Bank Card Number cant not be empty.');
    if (ifscController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('IFSC Code can not be empty.');
    BankInfoModel bankInfo = BankInfoModel(
      bankName: bankNameController.text,
      bankCardNo: bankCardNumberController.text,
      ifscCode: ifscController.text,
    );

    String? result = await CommonAlert.showAlert(message: 'Please confirm that the information in the previous three steps is correct. Once submitted, it cannot be changed.');
    if (result == 'ok') {
      await ApiUtil.bankInfoAuthenticate(bankInfo);
      // 获取推荐产品
      ContModel cont = await ApiUtil.fetchUserInfo(isRecommend: '1');
      if (cont.loanProductVo?.productId == null) {
        navigator?.popUntil((route) => route.isFirst);
      } else {
        Get.offNamedUntil(
          Routes.productDetail,
          (route) => route.isFirst,
          arguments: {'isRecommend': true, 'product': cont.loanProductVo},
        );
      }
    }
  }
}
