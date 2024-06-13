import 'dart:convert';

class LogoutresopnsMole {
  LogoutresopnsMole({required this.message, required this.status});

  late final status;
  late final String message;

  LogoutresopnsMole.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}

LogoutresopnsMole logoutresopnsMole(String str) =>
    LogoutresopnsMole.fromJson(json.decode(str));
