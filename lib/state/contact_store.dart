import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api.dart';
import '../page/model/contact.dart';
import 'event.dart';

class ContactState {
  ContactList? cur;
  int count = 0;
  List<ContactList> list = [];
  Map<String, ContactList> map = new Map();
}

class ContactStore extends Bloc<BittyEvent, ContactState> {
  ContactStore() : super(ContactState()) {
    on<InitEvent>((event, emit) async {
      var res = await Api.get("contact/list");
      if (res['code'] == 0) {
        (res['data'] as Map<String, dynamic>).entries.forEach((element) {
          var res = ContactList.fronJson(element.value);
          state.map.clear();
          state.list.clear();
          state.map.putIfAbsent(element.key, () => res);
          state.list.add(res);
          state.count++;
        });
        emit(state);
      }
    });
  }

  void setCur(String targetId) {
    state.cur = state.map[targetId];
  }
}
