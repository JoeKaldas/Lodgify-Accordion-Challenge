import 'dart:developer';

import 'package:dio/dio.dart';
import '../utils/modals.dart';

class NetworkInterceptor extends Interceptor {
  NetworkInterceptor();

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   super.onRequest(options, handler);
  // }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   if (response.data.containsKey('message')) {
  //     Modals.showDialog(
  //       child: ErrorPopup(
  //         message: response.data['message'],
  //       ),
  //     );
  //   }

  //   super.onResponse(response, handler);
  // }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('onError: $err');

    Modals.showErrorDialog();

    super.onError(err, handler);
  }
}
