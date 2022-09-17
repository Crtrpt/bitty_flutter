// ignore_for_file: non_constant_identifier_names

class Msg {
  Msg(
      {this.source_id,
      this.target_id,
      this.content,
      this.type,
      this.payload,
      this.created_at,
      this.result,
      this.result_payload,
      this.isread,
      this.status,
      this.level});

  final String? source_id;
  final String? target_id;
  final String? content;
  final int? type;
  final String? payload;
  final DateTime? created_at;
  final int? result;
  final String? result_payload;
  final int? isread;
  final int? status;
  final int? level;
  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
        source_id: json['source_id'] as String,
        target_id: json['target_id'] as String,
        content: json['content'] as String,
        type: json['type'] as int,
        payload: json['payload'] as String,
        created_at: json['created_at'] as DateTime,
        result: json['result'] as int,
        result_payload: json['result_payload'] as String,
        isread: json['isread'] as int,
        status: json['status'] as int,
        level: json['level'] as int,
      );
}
