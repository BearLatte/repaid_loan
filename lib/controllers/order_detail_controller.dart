import 'package:get/get.dart';
import 'package:repaid_loan/common/common_alert.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/order_model.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';
import 'package:repaid_loan/util/api_util/response_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum OrderDetailType { none, pending, disbursing, denied, disbursingFailed, unRepay, overdue, payed, overduePayed, throughFrozen }

class OrderDetailController extends GetxController {
  String title = '';
  OrderDetailType detailType = OrderDetailType.none;
  String? indicatorText;
  OrderModel? order;
  List<ProductModel> recommendProducts = [];
  bool extendBtnVisible = true;

  late String _orderNumber;

  void getOrderDetail(String orderNumber) async {
    _orderNumber = orderNumber;
    extendBtnVisible = await ApiUtil.fetchExtensionBtnVisible(orderNumber);
    ResponseModel<ProductModel> response = await ApiUtil.fetchOrderDetail(orderNumber);
    ContModel? cont = response.cont;
    order = cont?.loanAuditOrderVo;
    switch (order?.status) {
      case 0:
        title = 'Pending';
        detailType = OrderDetailType.pending;
        indicatorText = 'We have received your loan application, and we will notify you as soon as the result is obtained. You can also apply for other products.';
        break;
      case 1:
        title = 'Disbursing';
        detailType = OrderDetailType.disbursing;
        indicatorText = 'Your loan application is being disbursed, we will process it and let you know.';
        break;
      case 2:
        title = 'To be Repaid';
        detailType = OrderDetailType.unRepay;
        break;
      case 5:
        title = 'Overdue';
        detailType = OrderDetailType.overdue;
        break;
      case 6:
        title = 'Disbursing Fail';
        detailType = OrderDetailType.disbursingFailed;
        break;
      case 7:
        if (cont!.frozenDays! > 0) {
          title = 'Denied';
          detailType = OrderDetailType.denied;
          indicatorText = 'The loan you applied for cannot be approved, please reapply for this product after ${cont.frozenDays} days. You can now also directly apply for other products.';
        } else {
          title = 'Detail';
          detailType = OrderDetailType.throughFrozen;
          indicatorText = 'Congratulations, you can now apply for a loan now.';
        }
        break;
      case 8:
        title = 'Repaid';
        detailType = OrderDetailType.payed;
        break;
      case 9:
        title = 'Repaid';
        detailType = OrderDetailType.overduePayed;
        break;
    }
    recommendProducts = response.list ?? [];
    update();
  }

  void extensionBtnOnPressed() async {
    String? result = await CommonAlert.showAlert(message: 'Paying a small amount admission fee. You can pay the whole bill later.');
    if (result == 'ok') {
      Get.toNamed(Routes.extensionView);
    }
  }

  void repayBtnOnPressed() async {
    String? path = await ApiUtil.fetchRepayPath(_orderNumber);
    if (path != null && await canLaunchUrlString(path)) {
      await launchUrlString(path);
    }
  }
}
