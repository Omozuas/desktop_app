import 'dart:convert';

class LoginresopnsMole {
  LoginresopnsMole(
      {required this.message, required this.toen, required this.status});

  late final status;
  late final toen;
  late final String message;

  LoginresopnsMole.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    toen = json['token'];
    message = json['message'];
  }
}

LoginresopnsMole loginresopnsMole(String str) =>
    LoginresopnsMole.fromJson(json.decode(str));
