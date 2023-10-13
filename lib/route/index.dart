import 'package:get/get.dart';
import 'package:repaid_loan/controllers/home_controller.dart';
import 'package:repaid_loan/controllers/kyc_verify_controller.dart';
import 'package:repaid_loan/controllers/login_controller.dart';
import 'package:repaid_loan/controllers/personal_info_controller.dart';
import 'package:repaid_loan/controllers/profile_controller.dart';
import 'package:repaid_loan/views/about_us_view.dart';
import 'package:repaid_loan/views/authentication/kyc_front_example_view.dart';
import 'package:repaid_loan/views/authentication/kyc_verify_view.dart';
import 'package:repaid_loan/views/authentication/personal_info_view.dart';
import 'package:repaid_loan/views/login_view.dart';
import 'package:repaid_loan/views/profile_view.dart';

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

  /// 个人中心
  static const String profile = '/profile';

  /// about us
  static const String aboutUs = '/aboutUs';

  /// 登录
  static const String login = '/login';

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
      name: profile,
      transition: Transition.cupertino,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ProfileController())),
    ),
    GetPage(name: Routes.aboutUs, page: () => const AboutUsView(), transition: Transition.cupertino)
  ];
}
