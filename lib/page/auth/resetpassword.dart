class ResetPasswordform {
  String? account;
  String? code;
  String? password;
  String? email;

  Map<String, dynamic> toJson() => {
        'account': account,
        'password': password,
        'email': email,
        'code': code,
      };
}
