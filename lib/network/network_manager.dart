import 'dart:convert';

import 'package:dio/dio.dart';
import '../utils/consts.dart';
import 'network_interceptor.dart';
import 'parser.dart';

class NetworkManager {
  late Dio dio;

  NetworkManager() {
    dio = Dio();
    dio.options = BaseOptions(headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
    dio.interceptors
      ..add(NetworkInterceptor())
      ..add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
        ),
      );
  }

  Future<T> get<T>(String url, {Map<String, dynamic>? params}) async {
    params ??= {};

    final Response<dynamic> response = await dio.get(url);
    return parseResponse<T>(response)!;
  }

  Future<List<T>> getList<T>(
    String url, {
    Map<String, dynamic>? params,
  }) async {
    params ??= {};

    final Response<dynamic> response =
        await dio.get(url, queryParameters: params);
    return parseListResponse<T>(response)!;
  }

  Future<T> post<T>(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    body ??= {};

    final String formData = json.encode(body);
    final Response<dynamic> response = await dio.post(url, data: formData);

    return parseResponse<T>(response)!;
  }

  Future<T> postFormData<T>(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    body ??= {};

    final FormData formData = FormData.fromMap(body);
    final Response<dynamic> response = await dio.post(
      url,
      data: formData,
    );

    return parseResponse<T>(response)!;
  }

  Future<T> put<T>(String url, {required String body}) async {
    final formData = json.encode(body);
    final Response<dynamic> response = await dio.put(
      url,
      data: formData,
    );
    return parseResponse<T>(response)!;
  }

  Future<T?>? postString<T>(
    String url,
    String body,
  ) async {
    final Response<dynamic> response = await dio.post(
      url,
      data: body,
    );

    return parseResponse<T>(response)!;
  }

  Future<T?>? patch<T>(String url, {required Map<String, dynamic> body}) async {
    final Response<dynamic> response = await dio.patch(
      url,
      queryParameters: body,
    );

    return parseResponse<T>(response);
  }

  Future<T?> delete<T>(String url, {Map<String, dynamic>? params}) async {
    params ??= {};

    final Response<dynamic> response = await dio.delete(
      url,
      queryParameters: params,
    );

    return parseResponse<T>(response);
  }

  T? parseResponse<T>(Response<dynamic> response) {
    if (response.statusCode! > 299) {
      return null;
    }

    if (T == dynamic) {
      return response.data;
    }

    return Parser.parse<T>(response.data);
  }

  List<T>? parseListResponse<T>(Response<dynamic> response) {
    if (response.statusCode! > 299) {
      return null;
    }

    late List<dynamic> map;
    if (T == dynamic) {
      return response.data;
    } else {
      map = json.decode(response.data);
    }

    final List<T> list = [];

    for (final m in map) {
      list.add(Parser.parse<T>(m));
    }

    return list;
  }
}
