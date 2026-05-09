//setup dio networking

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {

  final Dio dio = Dio();

  DioClient() {

    dio.options.baseUrl = 'https://fakestoreapi.com';

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}