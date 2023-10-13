import 'package:flutter/material.dart';
import 'package:repaid_loan/util/colors_util.dart';

enum Gender { none, male, female }

enum CellType { normal, selection }

enum FormItemType { aadhaarName, aadhaarNumber, birth, marriage, education, address, panNumber, whatApp, industry, workTitle, salary, email }

class FormItemView extends StatelessWidget {
  final String title;
  final CellType cellType;
  final bool isMultiLines;
  final TextInputType? keyboardType;
  final TextEditingController? inputController;
  final Function()? onPressed;
  const FormItemView({
    super.key,
    required this.title,
    this.cellType = CellType.normal,
    this.inputController,
    this.isMultiLines = false,
    this.onPressed,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text(title, style: TextStyle(color: ColorsUtil.hexColor(0xA5A5A5))),
          ),
          TextField(
            controller: inputController,
            style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20, fontWeight: FontWeight.w600),
            readOnly: cellType == CellType.selection,
            maxLines: isMultiLines ? null : 1,
            onTap: onPressed,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: title,
              hintStyle: TextStyle(color: ColorsUtil.hexColor(0x999999)),
              prefixIcon: Container(),
              prefixIconConstraints: const BoxConstraints(maxWidth: 10),
              border: InputBorder.none,
              suffixIcon: cellType == CellType.selection ? IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_forward_ios, size: 15)) : null,
            ),
          ),
          Divider(color: ColorsUtil.hexColor(0xE1E3E8), height: 1, thickness: 1),
        ],
      ),
    );
  }
}
