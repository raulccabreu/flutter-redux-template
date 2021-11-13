import 'package:flutter_redux_template/middlewares/data_middleware.dart';
import 'package:flutter_redux_template/middlewares/navigation_middleware.dart';
import 'package:flutter_redux_template/models/app_state.dart';
import 'package:flutter_redux_template/reducers/app_state_reducer.dart';
import 'package:flutter_redux_template/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_redux_template/data/data_manager.dart';

void main() async {
  // Redux engine initialization
  final store = Store<AppState>(
    AppStateReducer(),
    initialState: const AppState(),
    middleware: [
      LoggingMiddleware.printer(),
      DataManager.instance.appStatePersistMiddleware(),
      NavigationMiddleware(),
      DataMiddleware()
    ],
  );

  //App start
  runApp(App(store: store));
}
