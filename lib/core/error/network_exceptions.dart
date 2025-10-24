import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;
  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;
  const factory NetworkExceptions.badRequest(String reason) = BadRequest;
  const factory NetworkExceptions.notFound(String reason) = NotFound;
  const factory NetworkExceptions.internalServerError(String reason) =
      InternalServerError;
  const factory NetworkExceptions.defaultError(String reason) = DefaultError;

  /// ✅ Simplified version for TheCatAPI or simple REST APIs
  static NetworkExceptions getDioException(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const NetworkExceptions.defaultError("⏱ Connection Timeout");

        case DioExceptionType.cancel:
          return const NetworkExceptions.requestCancelled();

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 0;
          final responseData = error.response?.data;

          String message = "⚠️ Something went wrong (${statusCode.toString()})";

          // Try to extract readable message from response body if possible
          if (responseData != null) {
            try {
              if (responseData is String) {
                message = responseData;
              } else if (responseData is Map<String, dynamic>) {
                message = responseData['message']?.toString() ?? message;
              }
            } catch (_) {}
          }

          if (statusCode == 400) {
            return NetworkExceptions.badRequest(message);
          } else if (statusCode == 401 || statusCode == 403) {
            return NetworkExceptions.unauthorizedRequest(message);
          } else if (statusCode == 404) {
            return NetworkExceptions.notFound(message);
          } else if (statusCode >= 500) {
            return NetworkExceptions.internalServerError(message);
          } else {
            return NetworkExceptions.defaultError(message);
          }

        case DioExceptionType.unknown:
          final msg = error.message ?? "⚠️ Unexpected Network Error";
          return NetworkExceptions.defaultError(msg);

        default:
          return const NetworkExceptions.defaultError("⚠️ Unexpected Error");
      }
    } else {
      return const NetworkExceptions.defaultError("⚠️ Unexpected Error");
    }
  }

  /// Get readable message for displaying in SnackBar, Toast, etc.
  static String getErrorMessage(NetworkExceptions ex) {
    return ex.when(
      requestCancelled: () => "Request Cancelled",
      unauthorizedRequest: (reason) => "Unauthorized: $reason",
      badRequest: (reason) => reason,
      notFound: (reason) => "Not Found: $reason",
      internalServerError: (reason) => "Server Error: $reason",
      defaultError: (reason) => reason,
    );
  }
}
