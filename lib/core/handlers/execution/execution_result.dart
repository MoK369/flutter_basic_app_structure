sealed class ExecutionResult<T> {}

class ExecutionSuccess<T> extends ExecutionResult<T> {
  T data;

  ExecutionSuccess({required this.data});
}

class ExecutionError<T> extends ExecutionResult<T> {
  Object error;

  ExecutionError({required this.error});
}
