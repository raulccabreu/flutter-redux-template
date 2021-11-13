import 'package:flutter_redux_template/actions/data_actions.dart';
import 'package:flutter_redux_template/models/app_state.dart';
import 'package:flutter_redux_template/reducers/foo_reducers.dart';
import 'package:redux/redux.dart';

class AppStateReducer extends ReducerClass<AppState> {
  @override
  AppState call(AppState state, action) {
    if (action is AppStateLoadedAction) {
      return action.appState;
    }

    return AppState(
      foo: sFooReducers(state.foo, action),
    );
  }
}
