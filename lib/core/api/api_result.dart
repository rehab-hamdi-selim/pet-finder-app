class ApiResult<T> {
  final T? data;
  final String? message;
  final Object? error;
  final bool isSuccess;

  ApiResult._({this.data, this.message, this.error, required this.isSuccess});

  factory ApiResult.success(T data, {String? message}) =>
      ApiResult._(data: data, message: message, isSuccess: true);

  factory ApiResult.failure(String message, {Object? error}) =>
      ApiResult._(message: message, error: error, isSuccess: false);

  factory ApiResult.stringSuccess(String message) =>
      ApiResult._(message: message, isSuccess: true);
}
