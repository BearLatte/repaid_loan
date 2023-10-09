import 'package:advertising_id/advertising_id.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static const _tokenKey = 'kAccessToken';
  static const _idfaKey = 'kIdfa';
  static const _loginKey = 'kLogin';

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

  /// 保存 idfa
  static Future<void> fetchAdvertisingId() async {
    PermissionStatus status = await Permission.appTrackingTransparency.request();
    if (status == PermissionStatus.granted) {
      String? idfa = await AdvertisingId.id(true);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(_idfaKey, idfa ?? '');
    }
  }
}
