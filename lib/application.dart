import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/route/index.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: Routes.pages,
      defaultTransition: Transition.cupertino,
      builder: EasyLoading.init(),
      onInit: () async {
        // 获取 IDFA 监控网络情况
        await Global.fetchAdvertisingId();
        // await (Connectivity().checkConnectivity());
      },
      // onReady: () async {
      //   ConnectivityResult result = await (Connectivity().checkConnectivity());
      //   if (result != ConnectivityResult.none) {
      //     await ApiUtil.firstRequest();
      //   }
      // },
    );
  }
}
