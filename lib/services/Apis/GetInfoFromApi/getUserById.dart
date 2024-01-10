import 'dart:convert';

import 'package:codegraniteflutter/services/ServiceUrl/connetionUrl.dart';
import 'package:codegraniteflutter/services/providers/user_Provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetUserApiProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Clientmodel> getClientById(String token, String id) async {
    setLoading(true);
    var getClientByid = "${AppUrl.baseUrl}account/$id";
    var res = await http.get(
      Uri.parse(getClientByid),
      headers: {
        'Content-Type': "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print(res.body);

    return clientmodel(res.body);
  }
}
