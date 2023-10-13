import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaid_loan/common/common_picker.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/personal_info_model.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';
import 'package:repaid_loan/views/authentication/form_item_view.dart';

class PersonalInfoController extends GetxController {
  TextEditingController panNumberController = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController workTitleController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController paytmController = TextEditingController();

  String panCardImage = 'assets/images/pan_simple_img.png';
  String? panCardImg;

  List<String> industryEnum = [];
  List<String> workTitleEnum = [];
  List<String> monthlySalaryEnum = [];

  @override
  void onInit() {
    fetchEnumList();
    getPersonalInfo();
    super.onInit();
  }

  void fetchEnumList() async {
    ContModel cont = await ApiUtil.fetchEnums();
    industryEnum = cont.industryList ?? [];
    workTitleEnum = cont.jobList ?? [];
    monthlySalaryEnum = cont.monthSalaryList ?? [];
  }

  void getPersonalInfo() async {
    ContModel cont = await ApiUtil.fetchUserAuthenticationInfo(step: 'loanapiUserBasic');
  }

  void panCardOnPressed() async {
    PermissionStatus status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      return CommonSnackBar.showSnackBar('You did not allow us to access the camera, which will help you obtain a loan. Would you like to set up authorization.');
    }
    XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imgFile == null) return;
    ContModel? cont = await ApiUtil.certificateRecognizer(imgFile.path, OCRType.pan);
    if (cont == null) return;
    panNumberController.text = cont.panNumber ?? '';
    panCardImage = imgFile.path;
    panCardImg = cont.panCardImg;
    update();
  }

  void cellItemOnPressed(FormItemType type) async {
    switch (type) {
      case FormItemType.industry:
        int? selectedIndex = await CommonPicker.showPicker(context: Get.context!, value: 0, options: industryEnum);
        if (selectedIndex != null) industryController.text = industryEnum[selectedIndex];
        break;
      case FormItemType.workTitle:
        int? selectedIndex = await CommonPicker.showPicker(context: Get.context!, value: 0, options: workTitleEnum);
        if (selectedIndex != null) workTitleController.text = workTitleEnum[selectedIndex];
        break;
      case FormItemType.salary:
        int? selectedIndex = await CommonPicker.showPicker(context: Get.context!, value: 0, options: monthlySalaryEnum);
        if (selectedIndex != null) salaryController.text = monthlySalaryEnum[selectedIndex];
        break;
      default:
        debugPrint('DEBUG: $type');
    }
  }

  void nextBtnOnPressed() async {
    if (panCardImg == null) return CommonSnackBar.showSnackBar('Please upload pan card image.');
    if (panNumberController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Pan Number can not be empty.');
    if (whatsAppController.text.trim().isEmpty || whatsAppController.text.trim().length != 10) return CommonSnackBar.showSnackBar('Please enter a 10-digit mobile number.');
    if (industryController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Industry can not be empty.');
    if (workTitleController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Work Title can not be empty.');
    if (salaryController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Monthly Salary can not be empty.');
    if (emailController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('E-mail can not be empty.');
    PersonalInfoModel info = PersonalInfoModel(
      panCardImg: panCardImg!,
      panNumber: panNumberController.text,
      job: workTitleController.text,
      email: emailController.text,
      industry: industryController.text,
      monthlySalary: salaryController.text,
      bodyImg: whatsAppController.text,
      paytmAccount: paytmController.text,
    );

    await ApiUtil.personalAuthenticate(info);
    Get.toNamed(Routes.contactsInfo);
  }
}
