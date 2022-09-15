class Signupform {
  String? account;
  String? password;
  String? email;
  bool agree = false;

  Map<String, dynamic> toJson() => {
        'account': account,
        'password': password,
        'email': email,
      };
}
