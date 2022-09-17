import 'package:bitty/api/mqtt.dart';
import 'package:bitty/model/payload.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api.dart';
import '../model/session.dart';
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
        state.sessionList.clear();
        state.sessionMap.clear();
        (res['data'] as Map<String, dynamic>).entries.forEach((element) {
          var res = SessionList.fronJson(element.value);
          state.sessionMap.putIfAbsent(element.key, () => res);
          state.sessionList.add(res);
          MqttClient.subject("/session/" + element.key + "/chat");
        });
        emit(state);
      }
    });
    on<SendMsgEvent>((event, emit) {
      var msg = event.payload;
      if ((state.curSession?.chatList?.length ?? 0) > 0) {
        Payload? lastMsg = state.curSession?.chatList?.last;
        msg.pre_id = lastMsg?.sender_id;
        msg.pre_sn = lastMsg?.sn;
      }
      msg.session_id = state.curSession?.session?.session_id;

      print("组装消息");
      MqttClient.publish("/session/", msg);
    });
    on<ReceivedMsgEvent>((event, emit) {
      print("接收到消息");
    });
    on<AddSessionEvent>((event, emit) {
      if (state.sessionMap
          .containsKey(event.sessionList.session!.session_id!)) {
        print("session 已存在");
      } else {
        state.sessionMap.putIfAbsent(
            event.sessionList.session!.session_id!, () => event.sessionList);
        state.sessionList.add(event.sessionList);
      }
    });
    on<RemoveSessionEvent>((event, emit) {
      print("删除session");
    });
  }

  void setCurSession(String sessionId) {
    print("设置当前session" + sessionId);
    state.curSession = state.sessionMap[sessionId];
  }
}
