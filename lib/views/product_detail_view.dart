import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/product_detail_controller.dart';
import 'package:repaid_loan/models/product_detail_model.dart';
import 'package:repaid_loan/util/colors_util.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailModel productDetail = Get.arguments['product'];
    final productController = Get.find<ProductDetailController>();
    productController.productId = productDetail.productId ?? '';
    productController.loanDate = productDetail.loanDate;
    productController.loanAmount = productDetail.loanAmountStr;
    return BaseView(
      title: 'Detail',
      extendBodyBehindAppBar: true,
      background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: const CommonImage(src: 'assets/images/product_detail_img.png'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(child: CommonImage(src: productDetail.logo, width: 50, height: 50)),
                      const SizedBox(width: 15),
                      Text(productDetail.spaceName, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20)),
                      const SizedBox(height: 8)
                    ],
                  ),
                  productItem('Amount', '₹ ${productDetail.loanAmountStr}'),
                  productItem('Terms', '${productDetail.loanDate} Days'),
                  productItem('Received Amount', '₹ ${productDetail.receiveAmountStr}'),
                  productItem('Verification Fee', '₹ ${productDetail.verificationFeeStr}'),
                  productItem('GST', '₹ ${productDetail.gstFeeStr}'),
                  productItem('Interest', '₹ ${productDetail.interestAmountStr}'),
                  productItem('Overdue Charge', '${productDetail.overdueChargeStr} day'),
                  productItem('Repayment Amount', '₹ ${productDetail.repayAmountStr}'),
                  GetBuilder<ProductDetailController>(
                    builder: (controller) => Container(
                      width: double.infinity,
                      height: 54,
                      margin: const EdgeInsets.fromLTRB(30, 30, 30, 35),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        onPressed: controller.loanProductOnPressed,
                        child: const Text('Loan now', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productItem(String key, String value) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key, style: TextStyle(color: ColorsUtil.hexColor(0xa5a5a5), fontSize: 18)),
          Text(value, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 18)),
        ],
      ),
    );
  }
}
