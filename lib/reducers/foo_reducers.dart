import 'package:flutter_redux_template/actions/foo_actions.dart';
import 'package:redux/redux.dart';

String _fooReducer(String foo, FooAction action) {
  return 'intermediate reduced loading foo';
}

String _fooBarReducer(String foo, FooBarAction action) {
  return action.fooBar;
}

final Reducer<String> sFooReducers = combineReducers<String>([
  TypedReducer<String, FooAction>(_fooReducer),
  TypedReducer<String, FooBarAction>(_fooBarReducer),
]);
