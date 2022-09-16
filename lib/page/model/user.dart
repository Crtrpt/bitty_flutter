// ignore_for_file: non_constant_identifier_names

class UserConfig {
  String? user_id;
}

class Token {
  String? user_id;
  String? token;
}

class User {
  User({
    this.account,
    this.nick_name,
    this.status,
    this.avatar,
    this.email,
    this.user_id,
    this.created_at,
    this.allow_search,
    this.allow_anon_session,
    this.level,
    this.member,
  });
  String? account;
  String? nick_name;
  String? status;
  String? avatar;
  String? email;
  String? user_id;
  String? union_id;
  int? union_type;
  String? created_at;
  int? allow_search;
  int? allow_anon_session;
  int? level;
  int? member;
  factory User.fromJson(Map<String, dynamic> json) => User(
      user_id: json['user_id'] as String,
      nick_name: json['nick_name'] as String,
      status: json['status'] as String,
      avatar: json['avatar'] as String,
      allow_search: json['allow_search'] as int,
      allow_anon_session: json['allow_anon_session'] as int,
      level: json['level'] as int,
      member: json['member'] as int);
}
