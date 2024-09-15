import 'package:dio/dio.dart';

class Request {
  late final Dio dio;

  Request({BaseOptions? options}) {
    dio = Dio(options);
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 请求拦截
    return handler.next(options);
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    // 响应拦截
    return handler.next(response);
  }

  void _onError(DioException error, ErrorInterceptorHandler handler) {
    // 错误处理
    return handler.next(error);
  }

// get请求
  Future<Map<String, dynamic>> get(String url, Map<String, dynamic>? params,
      {Map<String, dynamic>? headers}) async {
    var res = await dio.get(url,
        queryParameters: params, options: Options(headers: headers));
    return res.data!;
  }

// post请求
  Future<Map<String, dynamic>> post<T>(String url, Map<String, dynamic>? params,
      {Map<String, dynamic>? headers}) async {
    var res = await dio.post<T>(url,
        data: params, options: Options(headers: headers));
    return res.data! as Map<String, dynamic>;
  }
}

Request request =
    Request(options: BaseOptions(baseUrl: 'https://xxx.xxx.xx.x'));
