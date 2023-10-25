import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:adjust_sdk/adjust_event_success.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/api_util/index.dart';
import 'package:repaid_loan/util/colors_util.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    Global.setAppOpenTime();
    initAdjust();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: Routes.pages,
      defaultTransition: Transition.downToUp,
      builder: EasyLoading.init(),
      theme: ThemeData(colorScheme: ColorScheme.light(primary: ColorsUtil.hexColor(0x00AD8E))),
      onInit: () async {
        // 获取 IDFA 监控网络情况
        await Global.fetchAdvertisingId();
        ConnectivityResult result = await (Connectivity().checkConnectivity());
        if (result != ConnectivityResult.none) {
          await ApiUtil.firstRequest();
        }
      },
    );
  }

  void initAdjust() {
    AdjustConfig config = AdjustConfig('sg346zqpiuio', AdjustEnvironment.production);
    config.logLevel = AdjustLogLevel.verbose;
    config.defaultTracker = 'AppStore';
    config.allowAdServicesInfoReading = true;
    config.allowIdfaReading = true;
    config.deactivateSKAdNetworkHandling();
    config.linkMeEnabled = true;
    config.urlStrategy = AdjustConfig.UrlStrategyChina;

    config.eventSuccessCallback = (AdjustEventSuccess eventSuccessData) {
      if (eventSuccessData.eventToken != null) {
        debugPrint('[Adjust]: Event token: ${eventSuccessData.eventToken}');
      }
      if (eventSuccessData.message != null) {
        debugPrint('[Adjust]: Message: ${eventSuccessData.message}');
      }
      if (eventSuccessData.timestamp != null) {
        debugPrint('[Adjust]: Timestamp: ${eventSuccessData.timestamp}');
      }
      if (eventSuccessData.adid != null) {
        debugPrint('[Adjust]: Adid: ${eventSuccessData.adid}');
      }
      if (eventSuccessData.callbackId != null) {
        debugPrint('[Adjust]: Callback ID: ${eventSuccessData.callbackId}');
      }
      if (eventSuccessData.jsonResponse != null) {
        debugPrint('[Adjust]: JSON response: ${eventSuccessData.jsonResponse}');
      }
    };
    Adjust.start(config);
  }
}
