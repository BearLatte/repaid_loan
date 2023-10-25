import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/common_alert.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/util/api_util/index.dart';

import '../models/product_model.dart';

class ConfigFeedbackController extends GetxController {
  int? selectedTypeIndex;
  int? selectedProductIndex;
  String currentPhone = '';
  List<String> feedbackTypes = [];
  List<ProductModel> loanProductList = [];

  ProductModel? selectedProduct;
  TextEditingController productNameController = TextEditingController();
  TextEditingController feedbackContentController = TextEditingController();
  List<String> feedbackImgs = [];

  @override
  void onInit() {
    loadFeedbackParams();
    super.onInit();
  }

  void loadFeedbackParams() async {
    ContModel? cont = await ApiUtil.fetchFeedbackParams();
    currentPhone = cont?.phone ?? '';
    feedbackTypes = cont?.feedBackTypeList ?? [];
    loanProductList = cont?.loanProductList ?? [];
    update();
  }

  void selectFeedbackType(int index) {
    selectedTypeIndex = index;
    update();
  }

  void selectProduct() async {
    if (selectedProductIndex != null) {
      selectedProduct = loanProductList[selectedProductIndex!];
    }
    productNameController.text = selectedProduct?.loanName ?? '';
    update();
  }

  void updateSelectProduct(int index) {
    selectedProductIndex = index;
    selectedProduct = loanProductList[index];
    update();
  }

  void submitFeedback() async {
    if (selectedTypeIndex == null) return CommonSnackBar.showSnackBar('Please select your problem type.');
    if (selectedProductIndex == null) return CommonSnackBar.showSnackBar('Please select the product in problem.');
    if (feedbackContentController.text.trim().isEmpty) return CommonSnackBar.showSnackBar('Please enter the content of problem.');
    await ApiUtil.saveFeedback(
      phone: currentPhone,
      productId: selectedProduct!.id,
      feedBackType: feedbackTypes[selectedTypeIndex!],
      feedBackContent: feedbackContentController.text,
      feedBackImg: feedbackImgs,
    );
    String? result = await CommonAlert.showAlert(type: AlertType.success, message: 'Submitted successfully');
    if (result == 'ok') {
      Get.back();
    }
  }
}
