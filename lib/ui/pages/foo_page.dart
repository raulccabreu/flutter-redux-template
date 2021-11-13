import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_redux_template/actions/foo_actions.dart';
import 'package:flutter_redux_template/models/app_state.dart';

@immutable
class _FooPageViewModel {
  final String foo;
  final Function dispatcher;

  const _FooPageViewModel(this.foo, this.dispatcher);

  static _FooPageViewModel fromStore(Store<AppState> store) {
    return _FooPageViewModel(store.state.foo, (action) => store.dispatch(action));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _FooPageViewModel &&
        other.foo == foo &&
        other.dispatcher == dispatcher;
  }

  @override
  int get hashCode {
    return foo.hashCode ^ dispatcher.hashCode;
  }
}

class FooPage extends StatelessWidget {
  const FooPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _FooPageViewModel>(
      distinct: true,
      converter: (store) => _FooPageViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          body: TextButton(
            child: Text(viewModel.foo),
            onPressed: () => viewModel.dispatcher(FooAction()),
          )
        );
      },
    );
  }
}