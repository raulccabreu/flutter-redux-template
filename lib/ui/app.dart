import 'package:flutter_redux_template/models/app_state.dart';
import 'package:flutter_redux_template/ui/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_redux_template/actions/data_actions.dart';
import 'package:flutter_redux_template/data/data_manager.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataManager.instance.persistedAppStateLoad().then((appState){
      if (appState != null) {
        store.dispatch(AppStateLoadedAction(appState));
      }
    });

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp.router(
        routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
        routeInformationParser: const RoutemasterParser(),
        debugShowCheckedModeBanner: false,
        title: 'Redux Template',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey[100],
          primarySwatch: Colors.blueGrey,
        ),
      ),
    );
  }
}