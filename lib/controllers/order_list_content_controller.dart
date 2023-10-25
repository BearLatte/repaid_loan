import 'package:get/get.dart';
import 'package:repaid_loan/models/order_model.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/adjust_track_tool.dart';
import 'package:repaid_loan/util/api_util/index.dart';
import 'package:repaid_loan/util/api_util/response_model.dart';
import 'package:repaid_loan/util/order_type.dart';

class OrderListContentController extends GetxController {
  RxList<OrderModel> orders = <OrderModel>[].obs;
  void loadOrders(OrderType type) async {
    Map<String, dynamic> params = {};
    switch (type) {
      case OrderType.none:
        break;
      case OrderType.disbursing:
        params['status'] = 2;
        break;
      case OrderType.unRepay:
        params['status'] = 3;
        break;
      case OrderType.denied:
        params['status'] = 5;
        break;
      case OrderType.pending:
        params['status'] = 1;
        break;
      case OrderType.repaid:
        params['status'] = 4;
        break;
      case OrderType.overdue:
        params['status'] = 6;
        break;
    }
    ResponseModel<OrderModel> response = await ApiUtil.fetchOrders(params);
    orders.value = response.list ?? [];
  }

  void orderItemOnTap(OrderModel order) {
    ADJustTrackTool.trackWith('8nj4vc');
    Get.toNamed(Routes.orderDetail, arguments: order.loanOrderNo);
  }
}
