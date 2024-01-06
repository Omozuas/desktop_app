import 'package:codegraniteflutter/widgets/NavTabMenue/clienController.dart';
import 'package:codegraniteflutter/widgets/containers/headerContainerTitel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  final controller = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderContainerTitle(title: 'Clients'),
            Divider(),
            Expanded(
              child: Column(
                children: [
                  Obx(() => controller.screen[controller.selectedIndex.value]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
