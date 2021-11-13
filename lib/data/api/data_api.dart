import 'dart:core';

import 'package:flutter_redux_template/data/data_manager.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'data_api.g.dart';

@RestApi(baseUrl: "${DataManager.host}/api/v1")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/foo/1")
  Future<ApiFoo> getFoo();
}

@immutable
@JsonSerializable()
class ApiFoo {
  final String id;
  final String name;

  const ApiFoo(this.id, this.name);

  factory ApiFoo.fromJson(Map<String, dynamic> json) => _$ApiFooFromJson(json);
  Map<String, dynamic> toJson() => _$ApiFooToJson(this);
}
