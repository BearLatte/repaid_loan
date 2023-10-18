import 'package:date_format/date_format.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:repaid_loan/common/common_snack_bar.dart';
import 'package:repaid_loan/global/index.dart';
import 'package:repaid_loan/models/bank_info_model.dart';
import 'package:repaid_loan/models/cont_model.dart';
import 'package:repaid_loan/models/contacts_model.dart';
import 'package:repaid_loan/models/kyc_model.dart';
import 'package:repaid_loan/models/personal_info_model.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/util/api_util/response_model.dart';
import 'package:repaid_loan/util/dio_util/dio_method.dart';
import 'package:repaid_loan/util/dio_util/index.dart';

import '../random_util.dart';

enum OCRType { front, back, pan }

class ApiUtil {
  /// 第一个网络请求
  static Future<void> firstRequest() async {
    await _baseRequest('/XeGRdX/yFnPfz');
    return;
  }

  /// 登录前首页
  static Future<List<ProductModel>> fetchProductList() async {
    ResponseModel response = await _baseRequest('/XeGRdX/exgiqm');
    return response.cont?.loanProductList ?? [];
  }

  /// 发送短信
  static Future<void> sendOTP(String phone) async {
    void result = await _baseRequest('/XeGRdX/oLUNg', params: {'phone': phone});
    return Future.value();
  }

  /// 登录
  static Future<ContModel> login(String phone, String code) async {
    ResponseModel response = await _baseRequest('/XeGRdX/tXrkVPy', params: {'phone': phone, 'code': code});
    return response.cont!;
  }

  /// 获取用户信息
  static Future<ContModel> fetchUserInfo({String isRecommend = '0'}) async {
    ResponseModel response = await _baseRequest('/XeGRdX/OCaKry/Tpyrlnr', params: {'isRecommend': isRecommend});
    return response.cont!;
  }

  /// 退出登录
  static Future<void> logout() async => await _baseRequest('/XeGRdX/NFxxYr');

  /// 查询用户在space详情
  static Future<ContModel> checkSpaceDetail(String productId) async {
    ResponseModel response = await _baseRequest('/XeGRdX/OCaKry/LUTWOu', params: {'productId': productId});
    return response.cont!;
  }

  /// 获取下拉选择框数据
  static Future<ContModel> fetchEnums() async {
    ResponseModel response = await _baseRequest('/XeGRdX/OCaKry/oRCBDfQRJ');
    return response.cont!;
  }

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
    ResponseModel response = await _baseRequest('/XeGRdX/OCaKry/YYupEXAZCg', params: {'imgUrl': imageUrl, 'type': type});
    ContModel? cont = response.cont;
    switch (ocrType) {
      case OCRType.front:
        cont?.frontImg = imageUrl;
        break;
      case OCRType.back:
        cont?.backImg = imageUrl;
        break;
      case OCRType.pan:
        cont?.panCardImg = imageUrl;
        break;
    }
    EasyLoading.dismiss();
    return cont;
  }

  //获取用户认证信息
  static Future<ContModel> fetchUserAuthenticationInfo({String type = '2', required String step}) async {
    ResponseModel response = await _baseRequest('/XeGRdX/OCaKry/SVZUXHY', params: {'type': type, 'step': step});
    return response.cont!;
  }

  // 用户身份信息认证
  static Future<void> userKYCInfoAuthenticate(KYCModel kycInfo) async => await _baseRequest('/XeGRdX/OCaKry/vHuBq', params: kycInfo.toJson());

  // 用户个人信息认证
  static Future<void> personalAuthenticate(PersonalInfoModel personalInfo) async => await _baseRequest('/XeGRdX/OCaKry/oIAJobQ', params: personalInfo.toJson());

  // 用户联系人认证
  static Future<void> contactsAuthenticate(ContactsModel contacts) async => _baseRequest('/XeGRdX/OCaKry/xZsDED', params: contacts.toJson());

  // 银行卡信息认证
  static Future<void> bankInfoAuthenticate(BankInfoModel bankInfo) async => _baseRequest('/XeGRdX/OCaKry/aSBriBu', params: bankInfo.toJson());

  // 人脸认证
  static Future<bool> faceAuthenticate(String imgPath) async {
    EasyLoading.show(status: 'Authenticating...', maskType: EasyLoadingMaskType.black);
    var uploadResult = await uploadImage(imgPath);
    String? uploadedImgPath = uploadResult['imgPath'];
    if (uploadedImgPath == null) {
      EasyLoading.dismiss();
      return false;
    }
    await _baseRequest('/XeGRdX/OCaKry/kkPJPmSD', params: {'livenessImg': uploadedImgPath});
    EasyLoading.dismiss();
    return true;
  }

  // 生成借款订单并上传设备信息
  static Future<ResponseModel<ProductModel>> uploadDeviceInfoAndPurchaseProduct(Map<String, dynamic> params) async {
    ResponseModel<ProductModel> response = await _baseRequest<ProductModel>('/XeGRdX/OCaKry/zXsxwxEE', params: params);
    return response;
  }

  // 图片上传
  static Future<Map<String, dynamic>> uploadImage(String filePath) async {
    ResponseModel response = await _baseRequest('/XeGRdX/OCaKry/SXBZdv');
    ContModel? cont = response.cont;
    String date = formatDate(DateTime.now(), ['yyyy', '-', 'mm', '-', 'dd']);
    String objectKey = 'india/img/$date/${RandomUtil.generateRandomString(32)}.jpg';
    var result = await Global.channel.invokeMapMethod('uploadImage', {
      'image': filePath,
      'bucket': cont?.bucket,
      'endpoint': cont?.url,
      'destinationPath': objectKey,
      'credentials': cont?.credentials?.toJson(),
    });
    bool isSuccess = result?['isSuccess'];
    if (isSuccess) {
      return {'isSuccess': true, 'imgPath': objectKey};
    } else {
      return {'isSuccess': false};
    }
  }

  static Future<ResponseModel<T>> _baseRequest<T>(String path, {Map<String, dynamic>? params}) async {
    var json = await DioUtil().request(path, params: params, method: DioMethod.post);
    ResponseModel<T> response = ResponseModel<T>.fromJson(json['response']);
    return response;
  }
}
