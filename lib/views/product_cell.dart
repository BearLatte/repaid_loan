import 'package:flutter/material.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/util/random_util.dart';
import 'package:repaid_loan/widgets/dotted_line_widget.dart';

class ProductCell extends StatelessWidget {
  final ProductModel product;
  final bool topCorner;
  final Function()? onPressed;
  const ProductCell({super.key, required this.product, this.topCorner = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: topCorner ? const Radius.circular(20) : const Radius.circular(0),
            topRight: topCorner ? const Radius.circular(20) : const Radius.circular(0),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CommonImage(src: product.logo, width: 50, height: 50, fit: BoxFit.cover),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 8)),
                      Text(product.loanName, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 18, fontWeight: FontWeight.w600)),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                        decoration: BoxDecoration(color: ColorsUtil.hexColor(0x00AD8E), borderRadius: BorderRadius.circular(10)),
                        child: const Text('Detail', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 6)),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(product.fullAmountContent, style: TextStyle(color: ColorsUtil.hexColor(0x00AD8E), fontSize: 20, fontWeight: FontWeight.w600)),
                          const Padding(padding: EdgeInsets.only(bottom: 8)),
                          Text(product.fullRateContent, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(right: 20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Loan amount', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14)),
                          const Padding(padding: EdgeInsets.only(bottom: 15)),
                          Text('${product.loanDate} days', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 14)),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: ColorsUtil.hexColor(0xF5F6FC), borderRadius: BorderRadius.circular(13)),
                        child: Row(
                          children: <Widget>[
                            const CommonImage(src: 'assets/icons/product_score_icon.png'),
                            const Padding(padding: EdgeInsets.only(right: 6)),
                            Text(RandomUtil.randomScore(), style: TextStyle(color: ColorsUtil.hexColor(0x3D4455), fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  DottedLine(height: 1, color: ColorsUtil.hexColor(0xE2E2E2))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
