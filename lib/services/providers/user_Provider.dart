import 'dart:convert';

class Clientmodel {
  late final fullName;
  late final email;
  late final phoneNumber;
  late bool is_verified;
  late final theme;
  late final language;
  late final role;
  late final id;
  late bool success;
  late final message;
  late final account;

  Clientmodel(
      {required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.is_verified,
      required this.theme,
      required this.language,
      required this.message,
      required this.role,
      required this.id,
      required this.account,
      required this.success});
  Clientmodel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    account = json['account'];
    fullName = account['fullName'];
    email = account['email'];
    phoneNumber = account['phoneNumber'];
    is_verified = account['is_verified'];
    theme = account[' theme'];
    language = account['language'];
    role = account['role'];
    id = account['_id'];
  }
}

Clientmodel clientmodel(String str) => Clientmodel.fromJson(json.decode(str));
