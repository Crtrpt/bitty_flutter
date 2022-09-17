import 'package:bitty/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';
import 'event.dart';

class AuthState {
  bool isLogin = false;
  User? user;
  String? token = "";
  UserConfig? config;
  Token? curToken;
  String? union_id;
  int? union_type;
}

class UserState extends AuthState {}

class UserStore extends Bloc<BittyEvent, AuthState> {
  UserStore() : super(AuthState()) {
    on<LoginEvent>((event, emit) {
      print('=======================登录事件');
      var user = UserState();
      user.isLogin = true;
      user.token = event.payload['token'] as String;
      user.user = User.fromJson(event.payload['user']);
      user.union_id = event.payload['union_id'];
      user.union_type = event.payload['union_type'];
      Api.defaultHeader.putIfAbsent("token", () => user.token!);
      emit(user);
    });
    on<LogoutEvent>((event, emit) {
      emit(AuthState());
    });
    on<AppStartEvent>((event, emit) {
      emit(state);
    });
  }

  init() {
    try {
      var prefs = SharedPreferences.getInstance();
      prefs.then((p) => {p.getString("account")});
      // var account =.getString("account");
      // var content = prefs.getString("store");
    } catch (e) {
      print("ERROR--------------" + e.toString());
      WidgetsFlutterBinding.ensureInitialized();
    }
  }
}
