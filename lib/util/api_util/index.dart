import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/util/api_util/api_response.dart';
import 'package:repaid_loan/util/dio_util/dio_method.dart';
import 'package:repaid_loan/util/dio_util/index.dart';

class ApiUtil {
  /// 第一个网络请求
  static Future<void> firstRequest() async {
    await _baseObjectRequest('/XeGRdX/yFnPfz');
    return;
  }

  /// 登录前首页
  static Future<List<ProductModel>> fetchProductList() async {
    ContModel cont = await _baseObjectRequest('/XeGRdX/exgiqm');
    return cont.loanProductList;
  }

  /// 发送短信
  static Future<void> sendOTP(String phone) async {
    void result = await _baseObjectRequest('/XeGRdX/oLUNg', params: {'phone': phone});
    return Future.value();
  }

  /// 登录
  static Future<ContModel> login(String phone, String code) async {
    ContModel cont = await _baseObjectRequest('/XeGRdX/tXrkVPy', params: {'phone': phone, 'code': code});
    return cont;
  }

  /// 获取用户信息
  static Future<ContModel> fetchUserInfo() async {
    ContModel cont = await _baseObjectRequest('/XeGRdX/OCaKry/Tpyrlnr');
    return cont;
  }

  /// 退出登录
  static Future<void> logout() async => await _baseObjectRequest('/XeGRdX/NFxxYr');

  /// 查询用户在space详情
  static Future<ContModel> checkSpaceDetail(String productId) async {
    ContModel cont = await _baseObjectRequest('/XeGRdX/OCaKry/LUTWOu', params: {'productId': productId});
    return cont;
  }

  static Future<dynamic> _baseObjectRequest(String path, {Map<String, dynamic>? params}) async {
    var json = await DioUtil().request(path, params: params, method: DioMethod.post);
    ApiResponse response = ApiResponse.fromJson(json);
    return response.response.cont;
  }

  static Future<dynamic> _baseListRequest(String path, {Map<String, dynamic>? params}) async {
    var json = await DioUtil().request(path, method: DioMethod.post, params: params);
    ApiResponse response = ApiResponse.fromJson(json);
    return response.response.list;
  }
}
