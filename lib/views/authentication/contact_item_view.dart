import 'package:flutter/material.dart';
import 'package:repaid_loan/common/common_image.dart';
import 'package:repaid_loan/util/colors_util.dart';

class ContactItemView extends StatelessWidget {
  final String relation;
  final TextEditingController? numberController;
  final TextEditingController? nameController;
  final Function()? phoneOnPressed;
  final Function()? nameOnPressed;
  final bool numberEnable;
  const ContactItemView({
    super.key,
    required this.relation,
    this.numberController,
    this.nameController,
    this.phoneOnPressed,
    this.numberEnable = false,
    this.nameOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(relation, style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 16)),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  Text('Number', style: TextStyle(color: ColorsUtil.hexColor(0xA5A5A5), fontSize: 16)),
                  TextField(
                    controller: numberController,
                    readOnly: !numberEnable,
                    style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20, fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.phone,
                    onTap: numberEnable ? null : phoneOnPressed,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Number',
                      hintStyle: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: phoneOnPressed,
              padding: EdgeInsets.zero,
              icon: const CommonImage(src: 'assets/icons/contact_choose_icon.png'),
            ),
            const Padding(padding: EdgeInsets.only(right: 10)),
          ],
        ),
        Divider(color: ColorsUtil.hexColor(0xE1E3E8), thickness: 1, height: 1),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Name', style: TextStyle(color: ColorsUtil.hexColor(0xa5a5a5), fontSize: 16)),
              TextField(
                controller: nameController,
                onTap: nameOnPressed,
                style: TextStyle(color: ColorsUtil.hexColor(0x333333), fontSize: 20, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: ColorsUtil.hexColor(0x999999), fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        // const Padding(padding: EdgeInsets.only(top: 20)),
        Divider(color: ColorsUtil.hexColor(0xE1E3E8), thickness: 1, height: 1)
      ],
    );
  }
}
