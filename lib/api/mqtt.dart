import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttClient {
  static MqttServerClient? client =
      MqttServerClient.withPort('192.168.1.8', "", 9085);
  static BuildContext? ctx;

  static init(BuildContext context) async {
    // client?.logging(on: true);
    ctx = context;
    client?.onConnected = onConnect;
    client?.onDisconnected = onDisconnect;
    client?.connect("", "");
  }

  static onConnect() {
    print("消息服务器连接成功------------>");
    client?.subscribe("flutter/test", MqttQos.atMostOnce);
    client?.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print("收到消息: topic: ${c[0].topic} payload: ${pt} \n");
    });
  }

  static onDisconnect() {
    print("消息服务器断开连接------------x");
  }

  static subject(String topic) {
    print("订阅" + topic);
    client?.subscribe(topic, MqttQos.atMostOnce);
  }

  static publish(String topic, dynamic payload) {
    print("发布消息" + topic);
    print("消息体" + payload);
    var data = jsonEncode(payload);
    // Uint8
    final builder = MqttClientPayloadBuilder();
    builder.addString(data);
    client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!,
        retain: true);
  }
}
