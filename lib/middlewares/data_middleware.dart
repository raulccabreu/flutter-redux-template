import 'package:flutter_redux_template/actions/foo_actions.dart';
import 'package:flutter_redux_template/data/data_manager.dart';
import 'package:flutter_redux_template/models/app_state.dart';
import 'package:redux/redux.dart';

class DataMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is FooAction) {
      _getFoo(store);
    }

    next(action);
  }

  void _getFoo(Store<AppState> store) {
    DataManager.instance.getFoo(
      (foo) {
        store.dispatch(FooBarAction(foo.name));
      },
      () => {
        // TODO: do something when fail
      }
    );
  }
}
