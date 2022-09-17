import 'package:bitty/main.dart';
import 'package:bitty/model/payload.dart';
import 'package:bitty/model/session.dart';

abstract class BittyEvent {}

class AppStartEvent extends BittyEvent {}

class LoginEvent extends BittyEvent {
  var payload;
  LoginEvent(this.payload);
}

class LogoutEvent extends BittyEvent {}

class InitEvent extends BittyEvent {}

class AddSessionEvent extends BittyEvent {
  SessionList sessionList;
  AddSessionEvent(this.sessionList);
}

class RemoveSessionEvent extends BittyEvent {
  String? sessionId;
  RemoveSessionEvent({this.sessionId});
}

class SendMsgEvent extends BittyEvent {
  Payload payload;
  SendMsgEvent(this.payload);
}

class ReceivedMsgEvent extends BittyEvent {
  final payload;
  ReceivedMsgEvent(this.payload);
}
