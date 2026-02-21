import 'package:ansicolor/ansicolor.dart' show AnsiPen;
import 'package:dio/dio.dart' show Dio;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:injectable/injectable.dart' show module, lazySingleton;
import 'package:talker_dio_logger/talker_dio_logger.dart';

@module
abstract class DioService {
  @lazySingleton
  Dio getInstance() {
    final instance = Dio();

    if (kDebugMode) {
      instance.interceptors.add(
        TalkerDioLogger(
          settings: TalkerDioLoggerSettings(
            printResponseHeaders: true,
            printRequestHeaders: true,
            printResponseTime: true,
            printResponseRedirects: true,
            // Blue http requests logs in console
            requestPen: AnsiPen()..white(),
            // Green http responses logs in console
            responsePen: AnsiPen()..green(),
            // Error http logs in console
            errorPen: AnsiPen()..red(),
          ),
        ),
      );
    }

    return instance;
  }
}
