import 'package:codegraniteflutter/screens/client_Screen/client_Screen.dart';
import 'package:codegraniteflutter/screens/inviteScreen/invite_dialog.dart';
import 'package:codegraniteflutter/screens/notification_Screen/Notification_Screen.dart';
import 'package:codegraniteflutter/screens/problemStatement_Screen/problemStatement_screen.dart';
import 'package:codegraniteflutter/screens/project/project_Screen.dart';
import 'package:codegraniteflutter/screens/setting_screen/settings_Screen.dart';
import 'package:codegraniteflutter/screens/transaction_screen/transaction_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../screens/dashboard_Screen/Dashboard_screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    DashboardScreen(),
    ProblemStatementScreen(),
    ProjectScreen(),
    ClientsScreen(),
    TransactionScreen(),
    Container(color: Colors.green),
    NotificationScreen(),
    InviteDialog(),
    SettingsScreen(),
  ];
}
