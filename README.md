# flutter_redux_template

A new Flutter project.

## JSON

Models classes need this lines to json generator:

    part 'foo.g.dart'; //on imports

    factory Foo.fromJson(Map<String, dynamic> json) => _$FooFromJson(json);
    Map<String, dynamic> toJson() => _$FooToJson(this);

When model or api classes changes run:

    flutter pub run build_runner build --delete-conflicting-outputs

## Flutter Redux

### React Views

1. As a performance **optimization**, the **Widget** can be rebuilt only when the
   **ViewModel** changes. In order for this to work correctly, you must
   implement **==** and **hashCode** for the **ViewModel**, and set the **distinct**
   option to **true** when creating your **StoreConnector**.

2. Use sample method **fromStore** to encapsulate **store.state** to **viewModel** transformation

```dart
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
```
