// ignore_for_file: non_constant_identifier_names

class Group {
  Group(
      {this.name,
      this.group_id,
      this.own_user_id,
      this.session_id,
      this.created_at,
      this.description,
      this.allow_search,
      this.allow_anon_session,
      this.avatar,
      this.add_group_type,
      this.add_group_answer,
      this.add_group_question,
      this.type,
      this.member_count,
      this.max_member_count,
      this.level});
  String? name;
  String? group_id;
  String? own_user_id;
  String? session_id;
  String? created_at;
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
  factory Group.fromJson(Map<String, dynamic> json) => Group(
        name: json['name'] as String,
        avatar: json['avatar'] as String,
        group_id: json['group_id'] as String,
        session_id: json['session_id'] as String,
        own_user_id: json['own_user_id'] as String?,
        created_at: json['created_at'] as String?,
        description: json['description'] as String?,
        allow_search: json['allow_search'] as int,
        allow_anon_session: json['allow_anon_session'] as int,
        add_group_type: json['add_group_type'] as int,
        level: json['level'] as int,
        type: json['type'] as int,
        member_count: json['member_count'] as int,
        max_member_count: json['max_member_count'] as int,
        add_group_question: json['add_group_question'] as String,
        add_group_answer: json['add_group_answer'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatar': avatar,
      'group_id': group_id,
      'session_id': session_id,
      'own_user_id': own_user_id,
      'created_at': created_at,
      'description': description,
      'allow_search': allow_search,
      'allow_anon_session': allow_anon_session,
      'add_group_type': add_group_type,
      'level': level,
      'type': type,
      'member_count': member_count,
      'max_member_count': max_member_count,
      'add_group_question': add_group_question,
      'add_group_answer': add_group_answer,
    };
  }
}

class GroupMember {
  GroupMember(
      {this.group_id, this.user_id, this.type, this.created_at, this.name});
  String? group_id;
  String? user_id;
  int? type;
  String? created_at;
  String? name;
  factory GroupMember.fromJson(Map<String, dynamic> json) => GroupMember(
        group_id: json['group_id'] as String,
        user_id: json['user_id'] as String,
        type: json['type'] as int,
        created_at: json['created_at'] as String,
        name: json['name'] as String,
      );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'user_id': user_id,
      'group_id': group_id,
      "type": type,
      "created_at": created_at,
    };
  }
}

class GroupList {
  GroupList({this.group, this.config});
  Group? group;
  GroupMember? config;
  factory GroupList.fronJson(Map<String, dynamic> json) => GroupList(
      group: Group.fromJson(json['group']),
      config: GroupMember.fromJson(json['config']));
}
