import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowva/presentation/screens/teatcher/home_screen.dart';

class NavigationController extends GetxController {
  static final NavigationController instance = Get.find();
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }

  final List<Widget> screens = [
    const HomeScreen(),
    const Center(child: Text('Wallet Screen')),
    const Center(child: Text('Activity Screen')),
    const Center(child: Text('Analytics Screen')),
  ];
}
