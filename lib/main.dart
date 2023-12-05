import 'package:codegraniteflutter/firstNav_Menu.dart';
import 'package:codegraniteflutter/screens/signUp_screen.dart';
// import 'package:codegraniteflutter/seodNav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationMenue(),
    );
  }
}
