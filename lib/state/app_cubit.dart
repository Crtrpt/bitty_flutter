import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api.dart';
import '../page/model/session.dart';

abstract class BittyEvent {}

class LoginEvent extends BittyEvent {}

class LogoutEvent extends BittyEvent {}

class SessionState {
  SessionList? curSession;
  List<SessionList> sessionList = [];
  Map<String, SessionList> sessionMap = new Map();
}

class SessionCubit extends Bloc<BittyEvent, SessionState> {
  SessionCubit() : super(SessionState());

  void setCurSession(String sessionId) {
    print("=====================set session" + sessionId);
    state.curSession = state.sessionMap[sessionId];
  }

  void init() {
    print("===================== session_init");
    Api.get("session/list").then((res) {
      if (res['code'] == 0) {
        (res['data'] as Map<String, dynamic>).entries.forEach((element) {
          var res = SessionList.fronJson(element.value);
          state.sessionMap.putIfAbsent(element.key, () => res);
          state.sessionList.add(res);
        });
      }
    });
    emit(state);
  }
}
