import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'app_state.g.dart';

@immutable
@JsonSerializable()
class AppState {
  final String foo;

  const AppState({
    this.foo = 'This is not the api foo',
  });

  static AppState? fromJson(dynamic json) {
    return json != null ? _$AppStateFromJson(json) : null;
  }

  dynamic toJson() => _$AppStateToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AppState &&
      other.foo == foo;
  }

  @override
  int get hashCode => foo.hashCode;
}
