import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';

import '../models/product_model.dart';

class HomeController extends GetxController {
  bool _checkedNetwork = false;
  bool isLogin = false;
  bool isVerified = false;
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
    isLogin = await Global.isLogin;
    if (isLogin) {
      ContModel cont = await ApiUtil.fetchUserInfo();
      isVerified = cont.userStatus != 1;
      products = cont.loanProductList;
    } else {
      // 登录前产品获取
      products = await ApiUtil.fetchProductList();
    }
    update();
  }

  void productOnPressed(ProductModel product) async {
    if (!(await Global.isLogin)) {
      return Get.toNamed(Routes.login);
    }
    ContModel cont = await ApiUtil.checkSpaceDetail(product.id);
    if (cont.userStatus == 1) {
      Get.toNamed(Routes.kycVerify);
    }
  }

  void go2orders() {
    if (!isLogin) {
      Get.toNamed(Routes.login);
      return;
    }
    debugPrint('DEBUG: 查看订单列表');
  }

  void go2changeBankInfo() {
    if (!isLogin) {
      Get.toNamed(Routes.login);
      return;
    }
    debugPrint('DEBUG: 更改银行卡');
  }

  void go2profile() {
    Get.toNamed(Routes.profile);
  }
}
