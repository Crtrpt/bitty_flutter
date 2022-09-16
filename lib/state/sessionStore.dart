import 'package:bitty/api/mqtt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api.dart';
import '../page/model/session.dart';
import 'event.dart';

class ListState {}

class SessionState extends ListState {
  SessionList? curSession;
  List<SessionList> sessionList = [];
  Map<String, SessionList> sessionMap = new Map();
}

class SessionStore extends Bloc<BittyEvent, SessionState> {
  SessionStore() : super(SessionState()) {
    on<InitEvent>((event, emit) async {
      var res = await Api.get("session/list");
      if (res['code'] == 0) {
        (res['data'] as Map<String, dynamic>).entries.forEach((element) {
          var res = SessionList.fronJson(element.value);
          state.sessionMap.putIfAbsent(element.key, () => res);
          state.sessionList.add(res);
          MqttClient.subject("/session/" + element.key + "/chat");
        });
        emit(state);
      }
    });
  }

  void setCurSession(String sessionId) {
    state.curSession = state.sessionMap[sessionId];
  }
}
