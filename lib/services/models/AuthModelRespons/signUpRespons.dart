import 'dart:convert';

class SigupresopnsMole {
  SigupresopnsMole({required this.message, required this.success});

  late final success;

  late final String message;

  SigupresopnsMole.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}

SigupresopnsMole sigupresopnsMole(String str) =>
    SigupresopnsMole.fromJson(json.decode(str));
