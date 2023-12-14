import 'package:codegraniteflutter/screens/Notification_Screen.dart';
import 'package:codegraniteflutter/screens/client_Screen.dart';
import 'package:codegraniteflutter/screens/problemStatement_screen.dart';
import 'package:codegraniteflutter/screens/settings_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../screens/Dashboard_screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    DashboardScreen(),
    ProblemStatementScreen(),
    Container(color: Colors.blue),
    ClientsScreen(),
    Container(color: Colors.orange),
    Container(color: Colors.green),
    NotificationScreen(),
    Container(color: Colors.grey),
    SettingsScreen(),
  ];
}
