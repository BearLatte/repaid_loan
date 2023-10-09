import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';

import '../models/product_model.dart';

class HomeController extends GetxController {
  bool _checkedNetwork = false;
  List<ProductModel> products = [];

  @override
  void onInit() {
    checkConnectivityType();
    super.onInit();
  }

  void checkConnectivityType() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none && !_checkedNetwork) {
        loadHomeViewData();
        _checkedNetwork = true;
      }
    });
  }

  void loadHomeViewData() async {
    if (await Global.isLogin) {
    } else {
      // 登录前产品获取
      products = await ApiUtil.fetchProductList();
    }
    update();
    debugPrint('DEBUG: 一共调用了几次');
  }

  void productOnPressed(ProductModel product) async {
    if (!(await Global.isLogin)) {
     return Get.toNamed(Routes.login);
    }
    debugPrint('DEBUG: 当前点击的产品 id: ${product.id}');
  }

  void go2orders() {
    debugPrint('DEBUG: 查看订单列表');
  }

  void go2changeBankInfo() {
    debugPrint('DEBUG: 更改银行卡');
  }

  void go2profile() {
    Get.toNamed(Routes.profile);
  }
}
