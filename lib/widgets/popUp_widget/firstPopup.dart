import 'package:flutter/material.dart';

// class FirstPopUp {
//   static const String editProject = 'Edit Project';
//   static const String deleteProject = 'Delete Project';

//   static const List<String> choice = <String>[editProject, deleteProject];

//   static const Map<String, IconData> choiceicons = <String, IconData>{
//     editProject: Icons.edit,
//     deleteProject: Icons.delete_outline_sharp
//   };
// }
class Popupf extends StatelessWidget {
  const Popupf({super.key, required this.munelist, this.icon});
  final List<PopupMenuEntry> munelist;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) => munelist),
      icon: icon,
    );
  }
}
