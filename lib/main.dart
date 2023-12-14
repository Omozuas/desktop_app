import 'package:codegraniteflutter/firstNav_Menu.dart';
import 'package:codegraniteflutter/screens/Login_Screen.dart';
import 'package:codegraniteflutter/screens/signUp_screen.dart';
import 'package:codegraniteflutter/services/Apis/AuthApi/registerApi.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RegisterApiProvider())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationMenue(),
        localizationsDelegates: [CountryLocalizations.delegate],
      ),
    );
  }
}
