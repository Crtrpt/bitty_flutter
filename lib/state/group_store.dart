import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api.dart';
import '../model/group.dart';
import 'event.dart';

class GroupState {
  GroupList? cur;
  int count = 0;
  List<GroupList> list = [];
  Map<String, GroupList> map = new Map();
}

class GroupStore extends Bloc<BittyEvent, GroupState> {
  GroupStore() : super(GroupState()) {
    on<InitEvent>((event, emit) async {
      var res = await Api.get("group/list");
      state.list.clear();
      state.map.clear();
      state.count = 0;
      if (res['code'] == 0) {
        (res['data'] as Map<String, dynamic>).entries.forEach((element) {
          var res = GroupList.fronJson(element.value);

          state.map.putIfAbsent(element.key, () => res);
          state.list.add(res);
          state.count++;
        });
        emit(state);
      }
    });
  }

  void setCur(String groupId) {
    state.cur = state.map[groupId];
  }
}
