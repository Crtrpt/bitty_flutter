// ignore_for_file: non_constant_identifier_names

import 'package:bitty/model/payload.dart';

class SessionMember {
  const SessionMember(
      {this.user_id,
      this.session_id,
      this.session_type,
      this.name,
      this.avatar,
      this.session_name,
      this.session_avatar,
      this.suspend,
      this.attention,
      this.type,
      this.created_at});
  final String? user_id;
  final String? session_id;
  final int? session_type;
  final String? name;
  final String? avatar;
  final String? session_name;
  final String? session_avatar;
  final int? suspend;
  final int? attention;
  final int? type;
  final int sn = 0;
  final String? created_at;
  factory SessionMember.fromJson(Map<String, dynamic> json) => SessionMember(
        user_id: json['user_id'] as String,
        session_id: json['session_id'] as String,
        session_type: json['session_type'] as int,
        name: json['name'] as String,
        avatar: json['avatar'] as String,
        session_name: json['session_name'] as String,
        session_avatar: json['session_avatar'] as String,
        suspend: json['suspend'] as int,
        attention: json['attention'] as int,
        type: json['type'] as int,
        created_at: json['created_at'] as String,
      );
}

class Session {
  const Session({
    this.name,
    this.avatar,
    this.session_id,
    this.description,
    this.type,
    this.member_count,
    this.created_at,
  });
  final String? name;
  final String? avatar;
  final String? session_id;
  final String? description;
  final int? type;
  final int? member_count;
  final String? created_at;
  factory Session.fromJson(Map<String, dynamic> json) => Session(
        name: json['name'] as String,
        description: json['description'] as String,
        avatar: json['avatar'] as String,
        session_id: json['session_id'] as String,
        created_at: json['created_at'] as String,
      );
}

class SessionList {
  const SessionList({
    this.session,
    this.setting,
    this.chatList,
  });
  final List<Payload>? chatList;
  final SessionMember? setting;
  final Session? session;
  factory SessionList.fronJson(Map<String, dynamic> json) => SessionList(
      session: Session.fromJson(json['session']),
      setting: SessionMember.fromJson(json['setting']));
}
