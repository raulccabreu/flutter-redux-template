import 'package:flutter_redux_template/models/app_state.dart';
import 'package:flutter_redux_template/reducers/app_state_reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> store(AppState initialState) {
  return Store<AppState>(
    AppStateReducer(),
    initialState: initialState,
  );
}

void main() {
  //Test nothing
}
