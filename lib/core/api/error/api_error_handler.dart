import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../layers/localization/l10n/generated/app_localizations.dart'
    show AppLocalizations;

@lazySingleton
class ApiErrorHandler {
  AppLocalizations _appLocalizations;

  set appLocalizations(AppLocalizations appLocalization) {
    _appLocalizations = appLocalization;
  }

  ApiErrorHandler(this._appLocalizations);

  String handle(Object error) {
    if (error is Exception) {
      switch (error) {
        case SocketException():
          return _appLocalizations.connectionError;
        case HttpException():
          return _appLocalizations.couldNotFindSource;
        case FormatException():
          return _appLocalizations.badRequest;
        case DioException():
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
              return _appLocalizations.connectionTimeout;
            case DioExceptionType.sendTimeout:
              return _appLocalizations.sendTimeout;
            case DioExceptionType.receiveTimeout:
              return _appLocalizations.receiveTimeout;
            case DioExceptionType.badResponse:
              return _appLocalizations.somethingWentWrong;
            case DioExceptionType.cancel:
              return _appLocalizations.cancel;
            case DioExceptionType.connectionError:
              return _appLocalizations.connectionError;
            case DioExceptionType.unknown:
              return _appLocalizations.unknownError;
            case DioExceptionType.badCertificate:
              return _appLocalizations.badCertificate;
          }
        default:
          return _appLocalizations.somethingWentWrong;
      }
    } else {
      return error.toString();
    }
  }
}
