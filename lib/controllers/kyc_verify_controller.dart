import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaid_loan/common/common_alert.dart';
import 'package:repaid_loan/common/common_picker.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/kyc_model.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/adjust_track_tool.dart';
import 'package:repaid_loan/util/api_util/index.dart';
import 'package:repaid_loan/views/authentication/form_item_view.dart';

class KYCVerifyController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController marriageController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Gender currentGender = Gender.none;
  String kycFrontImage = 'assets/images/kyc_front_simple_img.png';
  String kycBackImage = 'assets/images/kyc_back_simple_img.png';
  String? frontImgUrl;
  String? backImgUrl;

  List<String> marriageEnum = [];
  List<String> educationEnum = [];

  @override
  void onInit() {
    fetchEnumList();
    getAuthenticationInfo();
    super.onInit();
  }

  void fetchEnumList() async {
    ContModel cont = await ApiUtil.fetchEnums();
    marriageEnum = cont.marryList ?? [];
    educationEnum = cont.eduList ?? [];
  }

  void getAuthenticationInfo() async {
    ContModel cont = await ApiUtil.fetchUserAuthenticationInfo(step: 'loanapiUserIdentity');
    nameController.text = cont.firstName ?? '';
    numberController.text = cont.aadharNumber ?? '';
    birthController.text = cont.dateOfBirth ?? '';
    currentGender = cont.gender == null ? Gender.none : (cont.gender == 'male' ? Gender.male : Gender.female);
    marriageController.text = cont.marriageStatus ?? '';
    educationController.text = cont.education ?? '';
    addressController.text = cont.residenceDetailAddress ?? '';
    kycFrontImage = cont.frontImg ?? 'assets/images/kyc_front_simple_img.png';
    kycBackImage = cont.backImg ?? 'assets/images/kyc_back_simple_img.png';
    frontImgUrl = cont.frontImg;
    backImgUrl = cont.backImg;
    update();
  }

  void frontCardOnPressed() async {
    ADJustTrackTool.trackWith('i5amqe');
    PermissionStatus status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      return CommonSnackBar.showSnackBar('You did not allow us to access the camera, which will help you obtain a loan. Would you like to set up authorization.');
    }

    var result = await Get.toNamed(Routes.frontExample);
    if (result == null) return;
    XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imgFile == null) return;
    ContModel? cont = await ApiUtil.certificateRecognizer(imgFile.path, OCRType.front);
    if (cont == null) return;
    kycFrontImage = imgFile.path;
    frontImgUrl = cont.frontImg;
    nameController.text = cont.aadharName ?? '';
    numberController.text = cont.aadharNumber ?? '';
    birthController.text = cont.dateOfBirth ?? '';
    currentGender = cont.gender == 'male' ? Gender.male : Gender.female;
    update();
  }

  void backCardOnPressed() async {
    ADJustTrackTool.trackWith('qeoepb');
    PermissionStatus status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      return CommonSnackBar.showSnackBar('You did not allow us to access the camera, which will help you obtain a loan. Would you like to set up authorization.');
    }

    XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imgFile == null) return;
    ContModel? cont = await ApiUtil.certificateRecognizer(imgFile.path, OCRType.back);
    if (cont == null) return;
    kycBackImage = imgFile.path;
    addressController.text = cont.addressAll ?? '';
    backImgUrl = cont.backImg;
    update();
  }

  void formItemOnPressed(FormItemType itemType) async {
    switch (itemType) {
      case FormItemType.aadhaarName:
        ADJustTrackTool.trackWith('qblpoa');
        break;
      case FormItemType.aadhaarNumber:
        ADJustTrackTool.trackWith('d2msxi');
        break;
      case FormItemType.address:
        ADJustTrackTool.trackWith('byp2xm');
        break;
      case FormItemType.marriage:
        ADJustTrackTool.trackWith('9h95m6');
        int? chooseIndex = await CommonPicker.showPicker(context: Get.context!, value: 0, options: marriageEnum);
        if (chooseIndex != null) marriageController.text = marriageEnum[chooseIndex];
        break;
      case FormItemType.education:
        ADJustTrackTool.trackWith('nyqw7w');
        int? chooseIndex = await CommonPicker.showPicker(context: Get.context!, value: 0, options: educationEnum);
        if (chooseIndex != null) educationController.text = educationEnum[chooseIndex];
        break;
      case FormItemType.birth:
        ADJustTrackTool.trackWith('osymdf');
        DateTime? selectedDate = await showDatePicker(
          context: Get.context!,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900, 01),
          lastDate: DateTime(2100, 01),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );
        if (selectedDate == null) return;
        birthController.text = formatDate(selectedDate, ['dd', '/', 'mm', '/', 'yyyy']);
        break;
      default:
        debugPrint('DEBUG: $itemType');
        break;
    }
  }

  void genderChanged(Gender gender) {
    currentGender = gender;
    ADJustTrackTool.trackWith('nzkmpm');
    update();
  }

  void nextOnPressed() async {
    ADJustTrackTool.trackWith('mypsnb');
    PermissionStatus status = await Permission.location.request();
    if (status != PermissionStatus.granted) {
      String? result =
          await CommonAlert.showAlert(message: 'This feature requires you to authorize this app to open the location service \nHow to set it: open phone Settings -> Privacy -> Location service');
      if (result == 'ok') {
        openAppSettings();
      }
    }

    if (frontImgUrl == null) return CommonSnackBar.showSnackBar('Please upload Aadhaar Card Front image!');
    if (backImgUrl == null) return CommonSnackBar.showSnackBar('Please upload Aadhaar Card Back image!');
    if (nameController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Aadhaar Name can not be empty!');
    if (numberController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Aadhaar Number can not be empty!');
    if (currentGender == Gender.none) return CommonSnackBar.showSnackBar('Please choose your gender!');
    if (birthController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Date of Birth can not be empty!');
    if (marriageController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Marriage Status can not be empty!');
    if (educationController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Education can not be empty!');
    if (addressController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Detail Address can not be empty!');
    await ApiUtil.userKYCInfoAuthenticate(
      KYCModel(
        frontImg: frontImgUrl!,
        backImg: backImgUrl!,
        firstName: nameController.text,
        aadharNumber: numberController.text,
        gender: currentGender == Gender.male ? 'male' : 'female',
        dateOfBirth: birthController.text,
        education: educationController.text,
        marriageStatus: marriageController.text,
        residenceDetailAddress: addressController.text,
      ),
    );
    Get.toNamed(Routes.personalInfo);
  }
}
