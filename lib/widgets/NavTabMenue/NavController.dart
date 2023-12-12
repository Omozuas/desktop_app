import 'package:codegraniteflutter/screens/WorkSheet_Screen.dart';
import 'package:codegraniteflutter/screens/settings_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../screens/Dashboard_screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    SettingsScreen(),
    WorkSheetScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.orange),
    Container(color: Colors.green),
    Container(color: Colors.pink),
    Container(color: Colors.amber),
    Container(color: Colors.grey),
    DashboardScreen(),
  ];
}
