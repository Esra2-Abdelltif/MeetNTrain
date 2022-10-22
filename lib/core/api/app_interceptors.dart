import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meet_n_train_app/core/api/events_api_constantace.dart';
import 'package:meet_n_train_app/core/utils/string_manager.dart';
///Interceptor feh 3 method
//onRequest lw 3awza a3ml 7aga mo3ina h3mla fe method(request)
class AppIntercepters extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers = {
      AppStrings.authorization: EventApiConstance.authorizationToken,
      AppStrings.contentType:  AppStrings.applicationJson
    };

    // options.headers[AppStrings.contentType] = AppStrings.applicationJson;
    // options.headers[AppStrings.authorization] = EventApiConstance.authorizationToken;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}