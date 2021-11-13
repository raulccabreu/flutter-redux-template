// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiFoo _$ApiFooFromJson(Map<String, dynamic> json) => ApiFoo(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ApiFooToJson(ApiFoo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://618fb5a8f6bf450017484a18.mockapi.io/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiFoo> getFoo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiFoo>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/foo/1',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiFoo.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
