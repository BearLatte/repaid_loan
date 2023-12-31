import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/controllers/home_controller.dart';
import 'package:repaid_loan/views/product_cell.dart';

import '../common/common_image.dart';
import '../util/colors_util.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<HomeController>();
    return GetBuilder<HomeController>(
      builder: (controller) {
        return FocusDetector(
          onFocusGained: controller.loadHomeViewData,
          child: BaseView(
            showBackButton: false,
            extendBodyBehindAppBar: true,
            body: Column(
              children: [
                // SizedBox(
                //   width: double.infinity,
                //   height: 200,
                //   child: ElevatedButton(
                //     onPressed: () => Get.toNamed(Routes.bankCardInfo),
                //     child: const Text('Test', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                //   ),
                // ),
                CommonImage(
                  src: controller.isVerified ? 'assets/images/verified_banner.png' : 'assets/images/banner.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: Container(
                    height: 95,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        menuItem(icon: 'assets/icons/menu_item_order.png', title: 'My Orders', onPressed: controller.go2orders),
                        menuItem(icon: 'assets/icons/menu_item_card.png', title: 'Change Bank Info', onPressed: controller.go2changeBankInfo),
                        menuItem(icon: 'assets/icons/menu_item_profile.png', title: 'Me', onPressed: controller.go2profile),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(
                            controller.products.length,
                            (index) => ProductCell(
                              product: controller.products[index],
                              topCorner: index == 0,
                              onPressed: () => controller.productOnPressed(controller.products[index]),
                            ),
                          ).toList(),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const Spacer(),
                          Transform.translate(
                              offset: const Offset(0, -22),
                              child: IconButton(
                                onPressed: controller.loadHomeViewData,
                                icon: const CommonImage(src: 'assets/icons/refresh.png', width: 44, height: 44, fit: BoxFit.cover),
                              )),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget menuItem({required String icon, required String title, Function()? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImage(src: icon),
          const Padding(padding: EdgeInsets.only(bottom: 4)),
          Text(title, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14)),
        ],
      ),
    );
  }
}
