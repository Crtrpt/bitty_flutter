// ignore_for_file: non_constant_identifier_names

class Payload {
  Payload({this.type, this.content, this.payload});
  String? sender_id;
  String? session_id;
  String? content;
  int? type;
  int? sn;
  String? created_at;
  int? send_type;
  int? msg_type;
  String? pre_id;
  int? pre_sn;
  dynamic payload;
}
