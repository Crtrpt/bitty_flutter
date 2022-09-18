// ignore_for_file: non_constant_identifier_names

class Msg {
  Msg({
    this.message_id,
    this.source_id,
    this.target_id,
    this.content,
    this.type,
    this.payload,
    this.created_at,
    this.result,
    this.result_payload,
    this.level,
    this.isread,
    this.status,
  });
  String? message_id;
  String? source_id;
  String? target_id;
  String? content;
  int? type;
  dynamic payload;
  String? created_at;
  int? result;
  String? result_payload;
  int? level;
  int? status;
  int? isread;
  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
        message_id: json['message_id'] as String,
        source_id: json['source_id'] as String,
        target_id: json['target_id'] as String,
        content: json['content'] as String,
        type: json['type'] as int,
        payload: json['payload'],
        created_at: json['created_at'] as String,
        result: json['result'] as int,
        result_payload: json['result_payload'] as String,
        level: json['level'] as int,
        status: json['status'] as int,
        isread: json['isread'] as int,
      );
}
