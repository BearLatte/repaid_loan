import 'package:get/get.dart';
import 'package:repaid_loan/controllers/bank_info_controller.dart';
import 'package:repaid_loan/controllers/config_feedback_controller.dart';
import 'package:repaid_loan/controllers/contact_info_controller.dart';
import 'package:repaid_loan/controllers/extension_pay_controller.dart';
import 'package:repaid_loan/controllers/feedback_list_controller.dart';
import 'package:repaid_loan/controllers/home_controller.dart';
import 'package:repaid_loan/controllers/kyc_verify_controller.dart';
import 'package:repaid_loan/controllers/login_controller.dart';
import 'package:repaid_loan/controllers/modify_bank_info_controller.dart';
import 'package:repaid_loan/controllers/order_detail_controller.dart';
import 'package:repaid_loan/controllers/order_list_controller.dart';
import 'package:repaid_loan/controllers/personal_info_controller.dart';
import 'package:repaid_loan/controllers/product_detail_controller.dart';
import 'package:repaid_loan/controllers/profile_controller.dart';
import 'package:repaid_loan/controllers/purchase_success_controller.dart';
import 'package:repaid_loan/views/about_us_view.dart';
import 'package:repaid_loan/views/authentication/bank_info_view.dart';
import 'package:repaid_loan/views/authentication/contact_info_view.dart';
import 'package:repaid_loan/views/authentication/kyc_front_example_view.dart';
import 'package:repaid_loan/views/authentication/kyc_verify_view.dart';
import 'package:repaid_loan/views/authentication/personal_info_view.dart';
import 'package:repaid_loan/views/config_feedback_view.dart';
import 'package:repaid_loan/views/feedback_detail_view.dart';
import 'package:repaid_loan/views/feedback_list_view.dart';
import 'package:repaid_loan/views/login_view.dart';
import 'package:repaid_loan/views/modify_bank_info_view.dart';
import 'package:repaid_loan/views/order_detail_view.dart';
import 'package:repaid_loan/views/order_list_view.dart';
import 'package:repaid_loan/views/product_detail_view.dart';
import 'package:repaid_loan/views/profile_view.dart';
import 'package:repaid_loan/views/purchase_success_view.dart';
import 'package:repaid_loan/views/repay_extension_view.dart';

import '../views/home_view.dart';

class Routes {
  /// 首页
  static const String home = '/';

  /// KYC info verify
  static const String kycVerify = '/kycVerify';

  /// KYC 正面示例
  static const String frontExample = '/example';

  /// 个人信息认证
  static const String personalInfo = '/personalInfo';

  /// 联系人认证
  static const String contactsInfo = '/contactInfo';

  /// 银行卡认证
  static const String bankCardInfo = '/bankCardInfo';

  /// 产品详情
  static const String productDetail = '/productDetail';

  /// 下单成功页面
  static const String purchaseSuccess = '/purchaseSuccess';

  /// 修改银行账号
  static const String modifyBankAccount = '/modifyBankAccount';

  /// 个人中心
  static const String profile = '/profile';

  /// about us
  static const String aboutUs = '/aboutUs';

  /// 登录
  static const String login = '/login';

  /// 订单列表
  static const String orderList = '/orderList';

  /// 订单详情
  static const String orderDetail = '/orderDetail';

  /// 展期还款页面
  static const String extensionView = '/extensionView';

  /// 反馈列表页
  static const String feedbackList = '/feedbackList';

  /// 添加反馈页面
  static const String configFeedback = '/configFeedback';

  /// 反馈详情页面
  static const String feedbackDetail = '/feedbackDetail';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => const HomeView(), binding: BindingsBuilder(() => Get.lazyPut(() => HomeController()))),
    GetPage(
      name: login,
      popGesture: false,
      page: () => const LoginView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: kycVerify,
      popGesture: false,
      page: () => const KYCVerifyView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => KYCVerifyController())),
    ),
    GetPage(name: frontExample, page: () => const KYCFrontExampleView(), popGesture: false),
    GetPage(
      name: personalInfo,
      page: () => const PersonalInfoView(),
      transition: Transition.cupertino,
      binding: BindingsBuilder(() => Get.lazyPut(() => PersonalInfoController())),
    ),
    GetPage(
      name: contactsInfo,
      transition: Transition.cupertino,
      page: () => const ContactInfoView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ContactInfoController())),
    ),
    GetPage(
      name: bankCardInfo,
      transition: Transition.cupertino,
      page: () => const BankInfoView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => BankInfoController())),
    ),
    GetPage(
      name: Routes.productDetail,
      transition: Transition.cupertino,
      page: () => const ProductDetailView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ProductDetailController())),
    ),
    GetPage(
      name: purchaseSuccess,
      transition: Transition.cupertino,
      page: () => const PurchaseSuccessView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => PurchaseSuccessController())),
    ),
    GetPage(
      name: profile,
      transition: Transition.cupertino,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ProfileController())),
    ),
    GetPage(name: aboutUs, page: () => const AboutUsView(), transition: Transition.cupertino),
    GetPage(
      name: modifyBankAccount,
      transition: Transition.cupertino,
      page: () => const ModifyBankInfoView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ModifyBankInfoController())),
    ),
    GetPage(
      name: orderDetail,
      transition: Transition.cupertino,
      page: () => const OrderDetailView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => OrderDetailController())),
    ),
    GetPage(
      name: orderList,
      transition: Transition.cupertino,
      page: () => const OrderListView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => OrderListController())),
    ),
    GetPage(
      name: extensionView,
      transition: Transition.cupertino,
      page: () => const RepayExtensionView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ExtensionPayController())),
    ),
    GetPage(
      name: feedbackList,
      transition: Transition.cupertino,
      page: () => const FeedbackListView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => FeedbackListController())),
    ),
    GetPage(
      name: configFeedback,
      transition: Transition.cupertino,
      page: () => ConfigFeedbackView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ConfigFeedbackController())),
    ),
    GetPage(name: feedbackDetail, transition: Transition.cupertino, page: () => const FeedbackDetailView()),
  ];
}
