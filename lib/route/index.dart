import 'package:get/get.dart';
import 'package:repaid_loan/controllers/home_controller.dart';
import 'package:repaid_loan/views/home_view.dart';

class Routes {
  /// 首页
  static const String home = '/';

  /// 登录
  static const String login = '/login';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => const HomeView(), binding: BindingsBuilder(() => Get.lazyPut(() => HomeController()))),
  ];
}
