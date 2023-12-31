import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/common_alert.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/adjust_track_tool.dart';
import 'package:repaid_loan/util/api_util/index.dart';

import '../models/product_model.dart';

class HomeController extends GetxController {
  bool _checkedNetwork = false;
  bool isLogin = false;
  bool isVerified = false;
  bool isShowPayFailAlert = false;
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
      products = cont.loanProductList ?? [];
      if (cont.userPayFail == 1 && !isShowPayFailAlert) {
        isShowPayFailAlert = true;
        String? result = await CommonAlert.showAlert(
          type: AlertType.loanFailed,
          infoModel: cont.userPayFailInfo,
        );
        if (result != null) isShowPayFailAlert = false;
      }
    } else {
      // 登录前产品获取
      products = await ApiUtil.fetchProductList();
    }
    update();
  }

  void productOnPressed(ProductModel product) async {
    if (!(await Global.isLogin)) {
      ADJustTrackTool.trackWith('f2fxf5');
      return Get.toNamed(Routes.login);
    }
    ContModel cont = await ApiUtil.checkSpaceDetail(product.id);
    if (cont.userStatus == 1) {
      ADJustTrackTool.trackWith('f2fxf5');
      Get.toNamed(Routes.kycVerify);
    } else if (cont.userStatus == 2) {
      ADJustTrackTool.trackWith('y9n3ay');
      Get.toNamed(Routes.productDetail, arguments: {'isRecommend': false, 'product': cont.loanProductVo});
    } else {
      ADJustTrackTool.trackWith('y9n3ay');
      Get.toNamed(Routes.orderDetail, arguments: cont.loanAuditOrderVo?.loanOrderNo);
    }
  }

  void go2orders() {
    ADJustTrackTool.trackWith('1auiwy');
    if (!isLogin) {
      Get.toNamed(Routes.login);
      return;
    }

    Get.toNamed(Routes.orderList);
  }

  void go2changeBankInfo() {
    ADJustTrackTool.trackWith('ybdxll');
    if (!isLogin) {
      Get.toNamed(Routes.login);
      return;
    }

    if (!isVerified) {
      Get.toNamed(Routes.kycVerify);
      return;
    }

    Get.toNamed(Routes.modifyBankAccount);
  }

  void go2profile() async {
    if (!(await Global.isLogin) || !isVerified) {
      ADJustTrackTool.trackWith('8gt76z');
    }
    Get.toNamed(Routes.profile);
  }
}
