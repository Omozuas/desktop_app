import 'package:codegraniteflutter/screens/project/DetailProject.dart';
import 'package:codegraniteflutter/screens/project/ListOfProjects.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProjectController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [ListOfProject(), DetailProject()];
}
