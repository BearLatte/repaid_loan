import 'package:date_format/date_format.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/kyc_model.dart';
import 'package:repaid_loan/models/personal_info_model.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/util/api_util/api_response.dart';
import 'package:repaid_loan/util/dio_util/dio_method.dart';
import 'package:repaid_loan/util/dio_util/index.dart';

import '../random_util.dart';

enum OCRType { front, back, pan }

class ApiUtil {
  /// 第一个网络请求
  static Future<void> firstRequest() async {
    await _baseObjectRequest('/XeGRdX/yFnPfz');
    return;
  }

  /// 登录前首页
  static Future<List<ProductModel>> fetchProductList() async {
    ContModel cont = await _baseObjectRequest('/XeGRdX/exgiqm');
    return cont.loanProductList ?? [];
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

  /// 获取下拉选择框数据
  static Future<ContModel> fetchEnums() async => await _baseObjectRequest('/XeGRdX/OCaKry/oRCBDfQRJ');

  // static Future
  /// OCR 识别
  static Future<ContModel?> certificateRecognizer(String filePath, OCRType ocrType) async {
    String type = 'AADHAAR_FRONT';
    switch (ocrType) {
      case OCRType.front:
        type = 'AADHAAR_FRONT';
        break;
      case OCRType.back:
        type = 'AADHAAR_BACK';
        break;
      case OCRType.pan:
        type = 'PAN_FRONT';
        break;
    }
    EasyLoading.show(status: 'identifying...', maskType: EasyLoadingMaskType.black);
    var uploadResult = await uploadImage(filePath);
    bool isSuccess = uploadResult['isSuccess'];
    if (!isSuccess) {
      EasyLoading.dismiss();
      CommonSnackBar.showSnackBar('Image upload failed');
      return null;
    }
    String imageUrl = uploadResult['imgPath'];
    ContModel cont = await _baseObjectRequest('/XeGRdX/OCaKry/YYupEXAZCg', params: {'imgUrl': imageUrl, 'type': type});
    switch (ocrType) {
      case OCRType.front:
        cont.frontImg = imageUrl;
        break;
      case OCRType.back:
        cont.backImg = imageUrl;
        break;
      case OCRType.pan:
        cont.panCardImg = imageUrl;
        break;
    }
    EasyLoading.dismiss();
    return cont;
  }

  //获取用户认证信息
  static Future<ContModel> fetchUserAuthenticationInfo({String type = '2', required String step}) async => await _baseObjectRequest('/XeGRdX/OCaKry/SVZUXHY', params: {'type': type, 'step': step});

  // 用户身份信息认证
  static Future<void> userKYCInfoAuthenticate(KYCModel kycInfo) async => await _baseObjectRequest('/XeGRdX/OCaKry/vHuBq', params: kycInfo.toJson());

  // 用户个人信息认证
  static Future<void> personalAuthenticate(PersonalInfoModel personalInfo) async => await _baseObjectRequest('/XeGRdX/OCaKry/oIAJobQ', params: personalInfo.toJson());

  // 图片上传
  static Future<Map<String, dynamic>> uploadImage(String filePath) async {
    ContModel cont = await _baseObjectRequest('/XeGRdX/OCaKry/SXBZdv');
    String date = formatDate(DateTime.now(), ['yyyy', '-', 'mm', '-', 'dd']);
    String objectKey = 'india/img/$date/${RandomUtil.generateRandomString(32)}.jpg';
    var result = await Global.channel.invokeMapMethod('uploadImage', {
      'image': filePath,
      'bucket': cont.bucket,
      'endpoint': cont.url,
      'destinationPath': objectKey,
      'credentials': cont.credentials?.toJson(),
    });
    bool isSuccess = result?['isSuccess'];
    if (isSuccess) {
      return {'isSuccess': true, 'imgPath': objectKey};
    } else {
      return {'isSuccess': false};
    }
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
