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

class FetchGroupState extends GroupState {}

class GroupStore extends Bloc<BittyEvent, GroupState> {
  GroupStore() : super(GroupState()) {
    on<InitEvent>((event, emit) async {
      emit(FetchGroupState());
      print("修改为group fetch状态");
      var res = await Api.get("group/list");

      if (res['code'] == 0) {
        var newState = GroupState();
        newState.list.clear();
        newState.map.clear();
        newState.count = 0;
        (res['data'] as Map<String, dynamic>).entries.forEach((element) {
          var res = GroupList.fronJson(element.value);

          newState.map.putIfAbsent(element.key, () => res);
          newState.list.add(res);
          newState.count++;
        });
        emit(newState);
      }
    });
  }

  void setCur(String groupId) {
    state.cur = state.map[groupId];
  }
}
