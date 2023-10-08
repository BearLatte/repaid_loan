import 'package:repaid_loan/util/api_util/api_response.dart';
import 'package:repaid_loan/util/dio_util/dio_method.dart';
import 'package:repaid_loan/util/dio_util/index.dart';

class ApiUtil {
  /// 第一个网络请求
  static Future<void> firstRequest() async {
    await _baseRequest('/XeGRdX/yFnPfz');
    return;
  }

  static Future<dynamic> _baseRequest(String path, {Map<String, dynamic>? params}) async {
    var json = await DioUtil().request(path, params: params, method: DioMethod.post);
    ApiResponse response = ApiResponse.fromJson(json);
    return response.response;
  }
}
