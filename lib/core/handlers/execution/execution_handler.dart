import 'dart:async';

import 'execution_result.dart';

abstract class ExecutionHandler {
  static FutureOr<ExecutionResult<T>> execute<T>(
    FutureOr<T> Function() apiCall,
  ) async {
    try {
      final result = await apiCall.call();
      return ExecutionSuccess(data: result);
    } catch (error) {
      return ExecutionError(error: error);
    }
  }
}
