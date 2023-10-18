import 'package:advertising_id/advertising_id.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static const _tokenKey = 'kAccessToken';
  static const _idfaKey = 'kIdfa';
  static const _loginKey = 'kLogin';
  static const _phoneKey = 'kPhone';
  static const _appOpenTimeKey = 'kAppOpenTime';
  static const _storeAppAccount = '';

  /// 与原生通信对象
  static const MethodChannel channel = MethodChannel('repaidLoan.app.channel');

  /// 判断测试账号
  static Future<bool> get isTestAccount async {
    String? phone = await accountPhone;
    return phone == _storeAppAccount ?? false;
  }

  /// token
  static Future<String> get accessToken async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey) ?? '';
  }

  /// login
  static Future<bool> get isLogin async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_loginKey) ?? false;
  }

  /// 获取 idfa
  static Future<String> get advertisingId async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? idfa = preferences.getString(_idfaKey);
    if (idfa == null || idfa == '00000000-0000-0000-0000-000000000000') return '';
    return idfa!;
  }

  /// 获取登录手机号
  static Future<String?> get accountPhone async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_phoneKey);
  }

  /// 保存app打开时间
  static void setAppOpenTime() async {
    int time = DateTime.now().millisecondsSinceEpoch;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_appOpenTimeKey, '$time');
  }

  /// 获取app打开时间
  static Future<String?> get appOpenTime async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_appOpenTimeKey);
  }

  /// 保存 idfa
  static Future<void> fetchAdvertisingId() async {
    PermissionStatus status = await Permission.appTrackingTransparency.request();
    if (status == PermissionStatus.granted) {
      String? idfa = await AdvertisingId.id(true);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(_idfaKey, idfa ?? '');
    }
  }

  /// 登录成功，配置信息
  static Future<void> loginSuccessConfig(ContModel content, String phone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_tokenKey, content.token!);
    preferences.setBool(_loginKey, true);
    preferences.setString(_phoneKey, phone);
  }

  /// 退出登录，删除配置信息
  static Future<void> logoutConfig() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_tokenKey, '');
    preferences.setBool(_loginKey, false);
    preferences.setString(_phoneKey, '');
  }

  /// 包版本号
  static Future<String> packageVersion() async {
    var package = await PackageInfo.fromPlatform();
    return package.version;
  }
}
