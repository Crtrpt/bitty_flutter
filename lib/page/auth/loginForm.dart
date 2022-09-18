import 'package:bitty/page/auth/login.dart';

class Loginform {
  String? account;
  String? password;
  bool rememenber = false;
  bool agree = false;

  Map<String, dynamic> toJson() => {
        'account': account,
        'password': password,
      };
}
