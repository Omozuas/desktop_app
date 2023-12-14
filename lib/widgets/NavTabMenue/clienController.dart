import 'package:codegraniteflutter/screens/clientDetails_screen.dart';
import 'package:codegraniteflutter/screens/detailsOfAclientScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ClientController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    ListOfClientsScreen(),
    DetailsOfAclientScreen(),
  ];
}
