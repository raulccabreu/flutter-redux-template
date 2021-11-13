import 'package:flutter_redux_template/data/api/data_api.dart';
import 'package:dio/dio.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:flutter_redux_template/models/app_state.dart';
import 'package:redux/redux.dart';

class DataManager {
  static const String host = 'https://618fb5a8f6bf450017484a18.mockapi.io';

  static final DataManager instance = DataManager._();
  
  final Dio _dio = Dio();
  late final RestClient _restClient;
  final _persistor = Persistor<AppState>(
    storage: FlutterStorage(location: FlutterSaveLocation.sharedPreferences),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  DataManager._() {
    _restClient = RestClient(_dio);
  }

  Middleware<AppState> appStatePersistMiddleware() {
    return _persistor.createMiddleware();
  }

  Future<AppState?> persistedAppStateLoad() async {
    return await _persistor.load();
  }

  void getFoo(Function(ApiFoo foo) success, Function() failure) {
    _restClient.getFoo().then((foo) => success(foo)).catchError((Object error) {
      if (error.runtimeType is DioError) {
        Response? errorResponse = (error as DioError).response;

        print("[${errorResponse!.statusCode}:${errorResponse.statusMessage}] "
            "${errorResponse.data}");
      } else {
        print(error);
      }

      failure();
    });
  }
}
