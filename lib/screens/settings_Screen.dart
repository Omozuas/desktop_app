import 'package:codegraniteflutter/colorsConstrain/colorsHex.dart';
import 'package:codegraniteflutter/seodNav.dart';
import 'package:codegraniteflutter/widgets/containers/headerContainerTitel_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderContainerTitle(title: 'Settings'),
          Divider(
            thickness: 1,
            color: GlobalColors.dividerLine,
          ),
          Expanded(child: SettingsNavMenue()),
        ],
      )),
    );
  }
}
