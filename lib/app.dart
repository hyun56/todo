import 'package:flutter/material.dart';
import 'package:nav/nav.dart';
import 'package:todo/data/memory/todo_data_holder.dart';
import 'package:todo/data/memory/todo_data_notifier.dart';

import 'common/theme/colors.dart';
import 'screen/main/s_main.dart';

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static bool isForeground = true;

  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> with Nav, WidgetsBindingObserver {
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  final notifier = TodoDataNotifier();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TodoDataHolder(
      notifier: notifier,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'todo',
        theme: ThemeData(
          primaryColor: mainColor,
          //colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        App.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        App.isForeground = false;
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
