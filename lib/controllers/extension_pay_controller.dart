import 'package:get/get.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/util/adjust_track_tool.dart';
import 'package:repaid_loan/util/api_util/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExtensionPayController extends GetxController {
  late String orderNumber;
  ContModel? cont;

  @override
  void onReady() {
    loadExtensionInfo(orderNumber);
    super.onReady();
  }

  void loadExtensionInfo(String orderNo) async {
    cont = await ApiUtil.fetchExtensionPayInfo(orderNo);
    update();
  }

  void extensionNowOnPressed() async {
    ADJustTrackTool.trackWith('zg1vaa');
    String? path = await ApiUtil.fetchRepayPath(orderNumber, repayType: 'extend');
    if (path != null && (await canLaunchUrlString(path))) {
      launchUrlString(path, mode: LaunchMode.inAppWebView);
    }
  }
}
