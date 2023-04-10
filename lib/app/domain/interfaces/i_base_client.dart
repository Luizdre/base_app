import 'package:dio/dio.dart';

abstract class IBaseClient {
  Future<Response<T>> delete<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Options? options});

  Future<Response<T>> fetch<T>(RequestOptions requestOptions);

  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Options? options});

  Future<Response<T>> patch<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Options? options});

  Future<Response<T>> post<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Options? options});

  Future<Response<T>> put<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Options? options});
}
