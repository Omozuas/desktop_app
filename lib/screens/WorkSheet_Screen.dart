import 'package:flutter/material.dart';

class WorkSheetScreen extends StatefulWidget {
  const WorkSheetScreen({super.key});

  @override
  State<WorkSheetScreen> createState() => _WorkSheetScreenState();
}

class _WorkSheetScreenState extends State<WorkSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('WorkSheet'),
    );
  }
}
