// ignore_for_file: non_constant_identifier_names

class Group {
  String? name;
  String? group_id;
  String? own_user_id;
  String? session_id;
  DateTime? created_at;
  String? description;
  int? allow_search;
  int? allow_anon_session;
  String? avatar;
  int? type;
  int? member_count;
  int? max_member_count;
  int? level;
  int? add_group_type;
  String? add_group_question;
  String? add_group_answer;
}

class GroupMember {
  String? group_id;
  String? user_id;
  int? type;
  DateTime? created_at;
  String? name;
}
