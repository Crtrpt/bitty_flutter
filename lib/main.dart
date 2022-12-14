import 'package:bitty/api/mqtt.dart';
import 'package:bitty/page/auth/login.dart';
import 'package:bitty/page/home.dart';
import 'package:bitty/route.dart';
import 'package:bitty/state/contact_store.dart';
import 'package:bitty/state/event.dart';
import 'package:bitty/state/group_store.dart';
import 'package:bitty/state/session_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state/userStore.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<UserStore>(
      create: (context) => UserStore(),
    ),
    BlocProvider<SessionStore>(
      create: (context) => SessionStore(),
    ),
    BlocProvider<ContactStore>(
      create: (context) => ContactStore(),
    ),
    BlocProvider<GroupStore>(
      create: (context) => GroupStore(),
    )
  ], child: Bitty()));
}

class Bitty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserStore>(context).add(AppStartEvent());
    MqttClient.init(context);
    return MaterialApp(
        title: 'Bitty',
        routes: route,
        home: BlocBuilder<UserStore, AuthState>(
          builder: (context, state) {
            return state.isLogin ? MainPage() : Login();
          },
        ));
  }
}
