import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/views/authentication/form_item_view.dart';

class KYCVerifyController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController marriageController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Gender currentGender = Gender.none;

  void fontCardOnPressed() async {
    PermissionStatus status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      return CommonSnackBar.showSnackBar('You did not allow us to access the camera, which will help you obtain a loan. Would you like to set up authorization.');
    }

    var result = await Get.toNamed(Routes.frontExample);
    if (result == null) return;
    XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imgFile == null) return;

    debugPrint('DEBUG: 上传图片');
  }

  void backCardOnPressed() {
    debugPrint('DEBUG: 选择身份证背面图片');
  }

  void formItemOnPressed(FormItemType itemType) {
    debugPrint('DEBUG: $itemType');
  }

  void genderChanged(Gender gender) {
    currentGender = gender;
    update();
  }

  void nextOnPressed() {}
}
