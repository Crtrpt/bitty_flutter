import 'package:bitty/page/auth/login.dart';
import 'package:bitty/page/home.dart';
import 'package:bitty/route.dart';
import 'package:bitty/state/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state/appState.dart';

late AppState state;
Future<void> main() async {
  //初始化状态
  state = new AppState();
  state.Init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<SessionCubit>(
      create: (context) => SessionCubit(),
    )
  ], child: Bitty()));
}

class Bitty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLogin = state.IsLogin;
    return MaterialApp(
      title: 'Bitty',
      routes: route,
      home: isLogin ? MainPage() : Login(),
    );
  }
}
