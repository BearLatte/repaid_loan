import 'package:flutter/material.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/util/colors_util.dart';

class OCRChoosePanel extends StatelessWidget {
  final String title;
  final String simpleImg;
  final Function()? cameraBtnOnPressed;
  const OCRChoosePanel({super.key, required this.title, required this.simpleImg, this.cameraBtnOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: CommonImage(src: simpleImg, fit: BoxFit.cover),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Container(
            width: 160,
            child: Column(
              children: [
                Text(title, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 16, fontWeight: FontWeight.w600)),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: cameraBtnOnPressed,
                      iconSize: 44,
                      padding: const EdgeInsets.only(right: 10),
                      icon: const CommonImage(src: 'assets/icons/camera_icon.png', fit: BoxFit.cover),
                    ),
                    Expanded(child: Text('Clear & original documents', style: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 14))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
