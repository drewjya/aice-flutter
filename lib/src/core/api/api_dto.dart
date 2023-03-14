// ignore_for_file: public_member_api_docs, sort_constructors_first

typedef TFromJsonBuilder<T> = T Function(Map<String, dynamic>);

enum ApiFailure {
  init(0),
  badFormat(99),
  connection(503),
  badrequest(400),
  unauthorized(401),
  forbidden(403),
  notfound(404),
  server(505);

  final int statusCode;
  const ApiFailure(this.statusCode);

  static ApiFailure fromRequest(int statusCode) {
    switch (statusCode) {
      case 400:
        return ApiFailure.badrequest;
      case 401:
        return ApiFailure.unauthorized;
      case 403:
        return ApiFailure.forbidden;
      case 404:
        return ApiFailure.notfound;
      case 503:
        return ApiFailure.connection;
      case 505:
        return ApiFailure.server;
      default:
        return ApiFailure.server;
    }
  }
}

class ErrorValue {
  final ApiFailure status;
  final String message;
  ErrorValue({
    required this.status,
    required this.message,
  });

  @override
  String toString() => 'ErrorValue(status: $status, message: $message)';
}

class ApiDTO<T> {
  final T? data;
  final List<T>? dataList;
  final ErrorValue? error;
  ApiDTO({
    this.data,
    this.error,
    this.dataList,
  });

  ApiDTO<T> copyWith({
    T? data,
    ErrorValue? error,
  }) {
    return ApiDTO<T>(
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  factory ApiDTO.fromMap(
      Map<String, dynamic> map, TFromJsonBuilder<T> fromJson, int statusCode) {
    List<T> dataList = [];
    T? dataVal;
    if (map['data'] is List) {
      dataList = (map['data'] as List)
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      dataVal = map['data'] != null
          ? fromJson((map['data'] as Map<String, dynamic>?) ?? {})
          : null;
    }
    final data = ApiDTO<T>(
      data: dataVal,
      dataList: dataList,
      error: map['error'] != null
          ? ErrorValue(
              status: ApiFailure.fromRequest(statusCode),
              message: map['error'] as String)
          : null,
    );
    return data;
  }

  @override
  String toString() => 'ApiDTO(data: $data, error: $error)';

  @override
  bool operator ==(covariant ApiDTO<T> other) {
    if (identical(this, other)) return true;

    return other.data == data && other.error == error;
  }

  @override
  int get hashCode => data.hashCode ^ error.hashCode;
}
