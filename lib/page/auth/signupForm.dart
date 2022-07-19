class Signupform {
  String? account;
  String? password;
  String? email;

  Map<String, dynamic> toJson() => {
        'account': account,
        'password': password,
        'email': email,
      };
}
