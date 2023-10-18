import 'package:flutter/widgets.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';

import '../models/cont_model.dart';
import '../models/contacts_model.dart';
import '../route/index.dart';

class ContactInfoController extends GetxController {
  TextEditingController parentNumberController = TextEditingController();
  TextEditingController familyNumberController = TextEditingController();
  TextEditingController colleagueNumberController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController colleagueNameController = TextEditingController();

  bool isNumberEnable = false;

  @override
  void onInit() {
    checkNumberEnable();
    getAuthenticatedContactsInfo();
    super.onInit();
  }

  void checkNumberEnable() async {
    isNumberEnable = await Global.isTestAccount;
    update();
  }

  void getAuthenticatedContactsInfo() async {
    ContModel cont = await ApiUtil.fetchUserAuthenticationInfo(step: 'loanapiUserLinkMan');
    parentNameController.text = cont.familyName ?? '';
    parentNumberController.text = cont.familyNumber ?? '';
    familyNameController.text = cont.brotherOrSisterName ?? '';
    familyNumberController.text = cont.brotherOrSisterNumber ?? '';
    colleagueNameController.text = cont.colleagueName ?? '';
    colleagueNumberController.text = cont.colleagueNumber ?? '';
    update();
  }

  void phoneIconOnPressed(String type) async {
    PermissionStatus status = await Permission.contacts.request();
    if (status != PermissionStatus.granted) {
      return CommonSnackBar.showSnackBar('You did not allow us to access the contacts. Allowing it will help you obtain a loan. Do you want to set up authorization.');
    }
    PhoneContact? phoneContact = await FlutterContactPicker.pickPhoneContact();
    switch (type) {
      case 'parents':
        parentNameController.text = phoneContact.fullName ?? '';
        parentNumberController.text = phoneContact.phoneNumber?.number ?? '';
      case 'family':
        familyNameController.text = phoneContact.fullName ?? '';
        familyNumberController.text = phoneContact.phoneNumber?.number ?? '';
      case 'colleague':
        colleagueNameController.text = phoneContact.fullName ?? '';
        colleagueNumberController.text = phoneContact.phoneNumber?.number ?? '';
    }
  }

  void nextBtnOnPressed() async {
    if (parentNameController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Parent Name can not be empty.');
    if (parentNumberController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Parent Number can not be empty.');
    if (familyNameController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Family Name can not be empty.');
    if (parentNumberController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Family Number can not be empty.');
    if (colleagueNameController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Colleague Name can not be empty.');
    if (colleagueNumberController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Colleague Number can not be empty.');
    ContactsModel contacts = ContactsModel(
      familyName: parentNameController.text,
      familyNumber: parentNumberController.text,
      colleagueName: colleagueNameController.text,
      colleagueNumber: colleagueNumberController.text,
      brotherOrSisterName: familyNameController.text,
      brotherOrSisterNumber: familyNumberController.text,
    );
    await ApiUtil.contactsAuthenticate(contacts);
    Get.toNamed(Routes.bankCardInfo);
  }
}
