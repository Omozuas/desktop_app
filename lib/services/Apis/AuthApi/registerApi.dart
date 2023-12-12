import 'dart:convert';
import 'package:codegraniteflutter/services/models/AuthModelRespons/loginRespons.dart';
import 'package:codegraniteflutter/services/models/AuthModelRespons/signUpRespons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../ServiceUrl/connetionUrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterApiProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<SigupresopnsMole> registerUser(String fullName, String email,
      String phoneNumber, String password) async {
    setLoading(true);
    var registration = "${AppUrl.baseUrl}account/register";
    var res = await http.post(Uri.parse(registration),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode({
          "fullName": fullName,
          "email": email,
          "phoneNumber": phoneNumber,
          "password": password
        }));
    print(res.body);
    if (res.statusCode == 201) {
      var jsonres = jsonDecode(res.body);

      print(jsonres['message']);

      print(res.body);
      setLoading(false);
    } else if (res.statusCode == 400) {
      var jsonres = jsonDecode(res.body);

      print(jsonres['message']);

      setLoading(false);
    } else if (res.statusCode == 500) {
      var jsonres = jsonDecode(res.body);
      print(jsonres['message']);
      setLoading(false);
    }
    return sigupresopnsMole(res.body);
  }

  Future<LoginresopnsMole> loginUser(String email, String password) async {
    setLoading(true);
    var registration = "${AppUrl.baseUrl}auth/login";
    var res = await http.post(Uri.parse(registration),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode({"email": email, "password": password}));
    print(res.body);
    if (res.statusCode == 200) {
      var jsonres = jsonDecode(res.body);
      final _preferences = await SharedPreferences.getInstance();
      _preferences.setString('token', jsonres['token']);
      print(jsonres['message']);
      setLoading(false);
    } else if (res.statusCode == 400) {
      var jsonres = jsonDecode(res.body);

      print(jsonres['message']);

      setLoading(false);
    } else if (res.statusCode == 404) {
      var jsonres = jsonDecode(res.body);

      print(jsonres['message']);

      setLoading(false);
    } else if (res.statusCode == 500) {
      var jsonres = jsonDecode(res.body);
      print(jsonres['message']);
      setLoading(false);
    }

    return loginresopnsMole(res.body);
  }
}
