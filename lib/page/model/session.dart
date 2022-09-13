// ignore_for_file: non_constant_identifier_names

import 'package:dino/page/message/message.dart';

class SessionMember {
  String? user_id;
  String? session_id;
  int? session_type;
  String? name;
  String? avatar;
  String? session_name;
  String? session_avatar;
  int? suspend;
  int? attention;
  int? type;
  DateTime? created_at;
}

class Session {
  String? name;
  String? avatar;
  String? session_id;
  String? description;
  int? type;
  int? member_count;
  DateTime? created_at;
}

class SessionList {
  List<Message>? chatList;
  SessionMember? setting;
  Session? session;
}
