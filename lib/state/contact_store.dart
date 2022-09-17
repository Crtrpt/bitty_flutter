import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api.dart';
import '../model/contact.dart';
import 'event.dart';

class ContactState {
  ContactList? cur;
  int count = 0;
  List<ContactList> list = [];
  Map<String, ContactList> map = new Map();
}

class FetchContactState extends ContactState {}

class ContactStore extends Bloc<BittyEvent, ContactState> {
  ContactStore() : super(ContactState()) {
    on<RemoveSessionEvent>((event, emit) {
      if (state.cur?.contact?.session_id == event.sessionId) {
        state.cur = null;
      }
      state.map.removeWhere(
          (key, value) => value.contact?.session_id == event.sessionId);
      state.list.removeWhere(
          (element) => element.contact?.session_id == event.sessionId);
    });
    on<InitEvent>((event, emit) async {
      emit(FetchContactState());
      print("修改为fetch状态");
      var res = await Api.get("contact/list");
      var newState = ContactState();
      if (res['code'] == 0) {
        newState.count = 0;
        (res['data'] as Map<String, dynamic>).entries.forEach((element) {
          var res = ContactList.fronJson(element.value);
          newState.map.putIfAbsent(element.key, () => res);
          newState.list.add(res);
          newState.count++;
        });
        print("联系人初始化 init================" + newState.count.toString());
        emit(newState);
      }
    });
  }

  void setCur(String targetId) {
    state.cur = state.map[targetId];
  }
}
