import 'package:get/get.dart';
import 'package:repaid_loan/controllers/home_controller.dart';
import 'package:repaid_loan/controllers/login_controller.dart';
import 'package:repaid_loan/controllers/profile_controller.dart';
import 'package:repaid_loan/views/login_view.dart';
import 'package:repaid_loan/views/profile_view.dart';

import '../views/home_view.dart';

class Routes {
  // 首页
  static const String home = '/';

  // 个人中心
  static const String profile = '/profile';

  // 登录
  static const String login = '/login';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => const HomeView(), binding: BindingsBuilder(() => Get.lazyPut(() => HomeController()))),
    GetPage(
      name: profile,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => ProfileController())),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
      transitionDuration: const Duration(milliseconds: 250),
    )
  ];
}
