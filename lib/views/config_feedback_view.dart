import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repaid_loan/common/base_view.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/controllers/config_feedback_controller.dart';
import 'package:repaid_loan/models/product_model.dart';
import 'package:repaid_loan/util/colors_util.dart';
import 'package:repaid_loan/widgets/hidden_keyboard_wraper.dart';
import 'package:repaid_loan/widgets/image_grid_view.dart';

class ConfigFeedbackView extends StatelessWidget {
  final bool isDetail;
  ConfigFeedbackView({super.key, this.isDetail = false});

  // final controller = Get.find<ConfigFeedbackController>();
  final OverlayState _overlayState = Overlay.of(Get.context!);
  late final OverlayEntry _overlayEntry = createOverlay();

  @override
  Widget build(BuildContext context) {
    return HiddenKeyboardWrapper(
      child: BaseView(
        title: 'Submit feedback',
        extendBodyBehindAppBar: true,
        background: Container(color: ColorsUtil.hexColor(0x00AD8E)),
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 12),
              child: const Text(
                'You can fill in the problems you encounter here, and we will solve them for you as soon as possible.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 35),
                  child: GetBuilder<ConfigFeedbackController>(
                    builder: (controller) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      Text(
                        'Phone number : ${controller.currentPhone}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 12, bottom: 16),
                        child: Row(
                          children: List.generate(
                            controller.feedbackTypes.length,
                            (index) => _inputSelect(
                              index,
                              typeTitle: controller.feedbackTypes[index],
                              isSelected: controller.selectedTypeIndex == index,
                              valueChanged: controller.selectFeedbackType,
                            ),
                          ).toList(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ColorsUtil.hexColor(0xE1E3E8)))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text('Loan Product', style: TextStyle(color: ColorsUtil.hexColor(0xA5A5A5), fontSize: 16)),
                            ),
                            Row(
                              children: [
                                if (controller.selectedProduct != null)
                                  Container(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: ClipOval(child: CommonImage(src: controller.selectedProduct!.logo, width: 40)),
                                  ),
                                Expanded(
                                  child: TextField(
                                    readOnly: true,
                                    controller: controller.productNameController,
                                    onTap: () {
                                      _overlayState.insert(_overlayEntry);
                                    },
                                    style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20, fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Loan Product',
                                      hintStyle: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 20, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: ColorsUtil.hexColor(0xE6E6E6))),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          TextField(
                            readOnly: isDetail,
                            controller: controller.feedbackContentController,
                            maxLines: null,
                            style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 16),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Good app.I hope it can be more convenient.',
                              hintStyle: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 16),
                            ),
                          ),
                          ImageGridView(onChanged: (pics) => controller.feedbackImgs = pics)
                        ]),
                      ),
                      Container(
                        height: 54,
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          onPressed: controller.submitFeedback,
                          child: const Text('Submit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _inputSelect(int index, {required String typeTitle, bool isSelected = false, required Function(int value) valueChanged}) {
    return Expanded(
      child: InkWell(
        onTap: () => valueChanged(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(color: isSelected ? ColorsUtil.hexColor(0x00AD8E) : ColorsUtil.hexColor(0xF2F2F2), borderRadius: BorderRadius.circular(10)),
          child: Text(typeTitle, textAlign: TextAlign.center, style: TextStyle(color: isSelected ? Colors.white : ColorsUtil.hexColor(0x999999), fontSize: 14)),
        ),
      ),
    );
  }

  OverlayEntry createOverlay() {
    return OverlayEntry(
      opaque: false,
      builder: (context) => Container(
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height * 0.65,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: GetBuilder<ConfigFeedbackController>(
              builder: (controller) => Column(
                children: [
                  Container(padding: const EdgeInsets.only(bottom: 20), child: Text('Loan Product', style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20))),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: List.generate(
                        controller.loanProductList.length,
                        (index) => productItem(controller.loanProductList[index], index: index, isSelected: index == controller.selectedProductIndex),
                      ).toList(),
                    ),
                  ),
                  Container(
                    height: 54,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                        onPressed: () {
                          if (controller.selectedProductIndex == null) {
                            return;
                          }
                          controller.selectProduct();
                          _overlayEntry.remove();
                        },
                        child: const Text('OK', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget productItem(ProductModel product, {required int index, bool isSelected = false}) {
    return GetBuilder<ConfigFeedbackController>(
      builder: (controller) => InkWell(
        onTap: () => controller.updateSelectProduct(index),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(children: [
                Container(padding: const EdgeInsets.only(right: 12), child: ClipOval(child: CommonImage(src: product.logo, width: 40))),
                Text(product.loanName),
              ])),
          Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off, color: ColorsUtil.hexColor(0x00AD8E), size: 38)
        ]),
      ),
    );
  }
}
