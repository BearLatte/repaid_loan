import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/purchase_success_controller.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/views/product_cell.dart';

class PurchaseSuccessView extends StatelessWidget {
  const PurchaseSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel?>? products = Get.arguments;
    final controller = Get.find<PurchaseSuccessController>();
    return BaseView(
      title: 'Detail',
      extendBodyBehindAppBar: true,
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 7),
              alignment: Alignment.center,
              child: const CommonImage(src: 'assets/images/purchase_success_img.png'),
            ),
            const Text('You have successfully applied', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: ColorsUtil.hexColor(0x00C371), borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        'Recommend the following products for you to get the more choices.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    if (products != null)
                      ...products!.map(
                        (product) => ProductCell(product: product!, onPressed: () => controller.productItemOnPressed(product!)),
                      )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
