import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final client = MqttServerClient('test.mosquitto.org', '');

void onConnected() {
  print('mqtt链接成功');
}

class Mqtt {
  init() async {
    //初始化mqtt
    try {
      client.logging(on: false);

      /// Set the correct MQTT protocol for mosquito
      client.setProtocolV311();

      /// If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
      client.keepAlivePeriod = 20;

      /// Add the successful connection callback
      client.onConnected = onConnected;

      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      print('EXAMPLE::socket exception - $e');
      client.disconnect();
    }
  }
}
