import 'package:codegraniteflutter/screens/client_Screen/detailsOfAclientScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../screens/client_Screen/clientDetails_screen.dart';

class ClientController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    ListOfClientsScreen(),
    DetailsOfAclientScreen(),
  ];
}
