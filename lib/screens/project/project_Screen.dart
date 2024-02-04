import 'package:codegraniteflutter/widgets/NavTabMenue/projectcontroller.dart';
import 'package:codegraniteflutter/widgets/containers/headerContainerTitel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderContainerTitle(title: 'Project'),
            Divider(),
            Column(
              children: [
                Obx(() => controller.screen[controller.selectedIndex.value]),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
