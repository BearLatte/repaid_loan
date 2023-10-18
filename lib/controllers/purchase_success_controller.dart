import 'package:get/get.dart';
import 'package:repaid_loan/models/product_model.dart';

import '../models/cont_model.dart';
import '../route/index.dart';
import '../util/api_util/index.dart';

class PurchaseSuccessController extends GetxController {
  void productItemOnPressed(ProductModel product) async {
    ContModel cont = await ApiUtil.checkSpaceDetail(product.id);
    if (cont.userStatus == 2) {
      Get.toNamed(
        Routes.productDetail,
        arguments: {'isRecommend': false, 'product': cont.loanProductVo},
      );
    }
  }
}
