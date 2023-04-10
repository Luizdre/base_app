import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:firebase/app/shared/components/urls.dart';
import 'package:firebase/app/domain/interfaces/i_base_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient implements IBaseClient {
  final Dio dio = Dio();

  final CacheOptions cacheOptions =
      CacheOptions(store: MemCacheStore(), policy: CachePolicy.noCache);

  final BaseOptions baseOptions = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
  );

  DioClient() {
    print('[ DioClient ] - Creating dio instance');
    dio.options = baseOptions;
    dio.interceptors.addAll([
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          error: true,
          request: true),
      DioCacheInterceptor(options: cacheOptions),
      RetryInterceptor(
          dio: dio, retries: 3, retryDelays: [const Duration(seconds: 1)])
    ]);
  }

  @override
  Future<Response<T>> delete<T>(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) {
    return dio.delete(path,
        data: data, queryParameters: queryParameters, options: options);
  }

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    return dio.fetch(requestOptions);
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    return dio.get(path, queryParameters: queryParameters, options: options);
  }

  @override
  Future<Response<T>> patch<T>(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) {
    return dio.patch(path,
        data: data, queryParameters: queryParameters, options: options);
  }

  @override
  Future<Response<T>> post<T>(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) {
    return dio.post(path,
        queryParameters: queryParameters, data: data, options: options);
  }

  @override
  Future<Response<T>> put<T>(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) {
    return dio.put(path,
        queryParameters: queryParameters, options: options, data: data);
  }
}
