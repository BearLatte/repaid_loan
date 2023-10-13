import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as GetX;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/route/index.dart';
import 'package:repaid_loan/util/md5_util.dart';
import 'package:repaid_loan/util/random_util.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    switch (options.path) {
      case '/XeGRdX/tXrkVPy':
        EasyLoading.show(status: 'login...', maskType: EasyLoadingMaskType.black);
      case '/XeGRdX/OCaKry/SXBZdv':
      case '/XeGRdX/OCaKry/YYupEXAZCg':
        break;
      default:
        EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    }

    options.headers['lang'] = 'en';
    PackageInfo package = await PackageInfo.fromPlatform();
    IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;

    // 配置 token
    if (options.path != '/XeGRdX/exgiqm' && options.path != '/XeGRdX/yFnPfz' && options.path != '/XeGRdX/tXrkVPy') {
      String token = await Global.accessToken;
      debugPrint('DEBUG: token = $token');
      options.headers['token'] = token;
    }

    Map<String, String?> deviceInfo = {};
    deviceInfo['appVersion'] = package.version;
    deviceInfo['bag'] = package.packageName;
    deviceInfo['brand'] = 'Apple';
    deviceInfo['channel'] = 'App Store';
    deviceInfo['deviceModel'] = iosInfo.name;
    deviceInfo['osVersion'] = iosInfo.systemVersion;
    deviceInfo['udid'] = iosInfo.identifierForVendor;
    deviceInfo['advertising_id'] = await Global.advertisingId;
    deviceInfo['mac'] = '';
    deviceInfo['operationSys'] = 'iOS';
    options.headers['deviceInfo'] = jsonEncode(deviceInfo);

    // 参数排序，签名
    Map<String, dynamic> params = options.queryParameters;
    options.queryParameters = _configParameters(params);
    debugPrint('DEBUG: 请求参数${options.queryParameters}');

    handler.next(options);
  }

  // 统一处理参数签名
  static Map<String, dynamic> _configParameters(Map<String, dynamic>? parameters) {
    Map<String, dynamic> newParams;

    if (parameters == null) {
      newParams = {'noncestr': RandomUtil.generateRandomString(30)};
    } else {
      newParams = Map.from(parameters);
      newParams['noncestr'] = RandomUtil.generateRandomString(30);
    }

    String signKey = '&indiakey=6ShEUmiNSp9sQWgBzS8N831zyJXlKEKrjqlcZBZN';
    String keyString = _sortedMapWith(newParams) + signKey;
    newParams['sign'] = MD5Util.md5String(keyString);
    return newParams;
  }

  // 参数排序
  static String _sortedMapWith(Map<String, dynamic> params) {
    List<String> allKeys = params.keys.toList();
    allKeys.sort((left, right) => left.toLowerCase().compareTo(right.toLowerCase()));

    var mapString = '';
    for (int i = 0; i < allKeys.length; i++) {
      String key = allKeys[i];
      String value = '${params[key]}';

      if (i == 0) {
        mapString = '$key=$value';
      } else {
        mapString = '$mapString&$key=$value';
      }
    }
    return mapString;
  }

  // @override
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    switch (response.requestOptions.path) {
      case '/XeGRdX/OCaKry/SXBZdv':
      case '/XeGRdX/OCaKry/YYupEXAZCg':
        break;
      default:
        EasyLoading.dismiss();
    }

    int resultCode = response.data['code'];
    String resultMsg = response.data['msg'];

    if (resultCode == -1) {
      GetX.Get.toNamed(Routes.login);
      return;
    }
    if (resultCode == 0) {
      EasyLoading.dismiss();
      CommonSnackBar.showSnackBar(resultMsg, type: SnackType.error);
      return;
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    EasyLoading.dismiss();
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        CommonSnackBar.showSnackBar(
          'The network connection timeout!',
          title: 'Network Error',
          type: SnackType.error,
        );
        break;
      case DioExceptionType.receiveTimeout:
        CommonSnackBar.showSnackBar(
          'The network data receiving timeout!',
          title: 'Network Error',
          type: SnackType.error,
        );
        break;
      case DioExceptionType.sendTimeout:
        CommonSnackBar.showSnackBar(
          'The request send timeout!',
          title: 'Network Error',
          type: SnackType.error,
        );
        break;
      case DioExceptionType.badResponse:
        CommonSnackBar.showSnackBar(
          'The response is bad!',
          title: 'Network Error',
          type: SnackType.error,
        );
        break;
      case DioExceptionType.cancel:
        CommonSnackBar.showSnackBar(
          'The request is canceled!',
          title: 'Network Error',
          type: SnackType.error,
        );
        break;

      case DioExceptionType.connectionError:
        CommonSnackBar.showSnackBar(
          'Connection error!',
          title: 'Network Error',
          type: SnackType.error,
        );
        break;
      default:
        CommonSnackBar.showSnackBar(
          'Unknown Error!',
          title: 'Network Error',
          type: SnackType.error,
        );
        break;
    }
  }
}
