import 'package:dio/dio.dart' show Dio, BaseOptions;

import '../../../di/injectable_initializer.dart';
import '../../endpoints/api_endpoints.dart';

abstract class DioHelpers {
  static Dio getDefault(String token) {
    return getIt.get<Dio>()
      ..options = BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
  }
}
