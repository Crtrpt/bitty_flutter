import 'package:bitty/main.dart';

abstract class BittyEvent {}

class AppStartEvent extends BittyEvent {}

class LoginEvent extends BittyEvent {
  var paylaod;

  LoginEvent(this.paylaod);
}

class LogoutEvent extends BittyEvent {}

class InitEvent extends BittyEvent {}

class SendMsgEvent extends BittyEvent {
  final payload;
  SendMsgEvent(this.payload);
}

class ReceivedMsgEvent extends BittyEvent {
  final payload;
  ReceivedMsgEvent(this.payload);
}
