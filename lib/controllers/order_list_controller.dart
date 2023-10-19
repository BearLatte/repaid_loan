import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController with GetSingleTickerProviderStateMixin {
  List<Tab> tabs = const [
    Tab(text: 'All Orders'),
    Tab(text: 'Disbursing'),
    Tab(text: 'To be Repaid'),
    Tab(text: 'Denied'),
    Tab(text: 'Pending'),
    Tab(text: 'Repaid'),
    Tab(text: 'Overdue'),
  ];

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
