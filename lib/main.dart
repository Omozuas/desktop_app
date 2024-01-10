import 'package:codegraniteflutter/firstNav_Menu.dart';
import 'package:codegraniteflutter/screens/Login_Screen.dart';
import 'package:codegraniteflutter/services/Apis/AuthApi/registerApi.dart';
import 'package:codegraniteflutter/services/Apis/GetInfoFromApi/getUserById.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    token: prefs.getString('token'),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.token});
  String? token;

  @override
  Widget build(BuildContext context) {
    print("token: $token");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterApiProvider()),
        ChangeNotifierProvider(create: (_) => GetUserApiProvider())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: JwtDecoder.isExpired(token!) ? LoginScreen() : NavigationMenue(),
        localizationsDelegates: [CountryLocalizations.delegate],
      ),
    );
  }
}
