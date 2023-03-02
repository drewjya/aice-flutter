import 'package:aice/src/core/core.dart';
import 'package:meta/meta.dart';

@sealed
@immutable
abstract class ProviderValue<T> {
  const ProviderValue._();

  const factory ProviderValue.data(T value) = ProviderData<T>;

  const factory ProviderValue.loading() = ProviderLoading<T>;

  const factory ProviderValue.error(ErrorValue error) = ProviderError<T>;

  static Future<ProviderValue<T>> guard<T>(Future<T> Function() future) async {
    try {
      return ProviderValue.data(await future());
    } on ErrorValue catch (err) {
      if (err.status == ApiFailure.unauthorized) {
        await SharedPrefs.removeSession();
      }
      return ProviderValue.error(err);
    } catch (e) {
      dPrint(e);
      String message;
      try {
        final error = e as dynamic;
        message = error.message;
      } catch (e) {
        message = 'Harap Hubungi Tim IT $e';
      }
      final err = ErrorValue(
        status: ApiFailure.notfound,
        message: message,
      );
      return ProviderValue.error(err);
    }
  }

  bool get isLoading;

  bool get hasValue;

  T? get value;

  ErrorValue? get error;

  R map<R>({
    required R Function(ProviderData<T> data) data,
    required R Function(ProviderError<T> error) error,
    required R Function(ProviderLoading<T> loading) loading,
  });

  ProviderValue<T> copyWithPrevious(
    ProviderValue<T> previous, {
    bool isRefresh = true,
  });

  ProviderValue<T> unwrapPrevious() {
    return map(
      data: (d) {
        if (d.isLoading) return ProviderLoading<T>();
        return ProviderData(d.value);
      },
      error: (e) {
        if (e.isLoading) return ProviderLoading<T>();
        return ProviderError(e.error);
      },
      loading: (l) => ProviderLoading<T>(),
    );
  }

  @override
  String toString() {
    final content = [
      if (isLoading && this is! ProviderLoading) 'isLoading: $isLoading',
      if (hasValue) 'value: $value',
      if (hasError) ...[
        'error: $error',
      ]
    ].join(', ');

    return '$runtimeType($content)';
  }

  @override
  bool operator ==(Object other) {
    return runtimeType == other.runtimeType &&
        other is ProviderValue<T> &&
        other.isLoading == isLoading &&
        other.hasValue == hasValue &&
        other.error == error &&
        other.valueOrNull == valueOrNull;
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        isLoading,
        hasValue,
        valueOrNull ?? 0,
        error ?? 0,
      );
}

class ProviderData<T> extends ProviderValue<T> {
  const ProviderData(T value)
      : this._(
          value,
          isLoading: false,
          error: null,
        );

  const ProviderData._(
    this.value, {
    required this.isLoading,
    required this.error,
  }) : super._();

  @override
  final T value;

  @override
  bool get hasValue => true;

  @override
  final bool isLoading;

  @override
  final ErrorValue? error;

  @override
  R map<R>({
    required R Function(ProviderData<T> data) data,
    required R Function(ProviderError<T> error) error,
    required R Function(ProviderLoading<T> loading) loading,
  }) {
    return data(this);
  }

  @override
  ProviderData<T> copyWithPrevious(
    ProviderValue<T> previous, {
    bool isRefresh = true,
  }) {
    return this;
  }
}

class ProviderLoading<T> extends ProviderValue<T> {
  const ProviderLoading()
      : hasValue = false,
        value = null,
        error = null,
        super._();

  const ProviderLoading._({
    required this.hasValue,
    required this.value,
    required this.error,
  }) : super._();

  @override
  bool get isLoading => true;

  @override
  final bool hasValue;

  @override
  final T? value;

  @override
  final ErrorValue? error;

  @override
  R map<R>({
    required R Function(ProviderData<T> data) data,
    required R Function(ProviderError<T> error) error,
    required R Function(ProviderLoading<T> loading) loading,
  }) {
    return loading(this);
  }

  @override
  ProviderValue<T> copyWithPrevious(
    ProviderValue<T> previous, {
    bool isRefresh = true,
  }) {
    if (isRefresh) {
      return previous.map(
        data: (d) => ProviderData._(
          d.value,
          isLoading: true,
          error: d.error,
        ),
        error: (e) => ProviderError._(
          e.error,
          isLoading: true,
          value: e.valueOrNull,
          hasValue: e.hasValue,
        ),
        loading: (_) => this,
      );
    } else {
      return previous.map(
        data: (d) => ProviderLoading._(
          hasValue: true,
          value: d.valueOrNull,
          error: d.error,
        ),
        error: (e) => ProviderLoading._(
          hasValue: e.hasValue,
          value: e.valueOrNull,
          error: e.error,
        ),
        loading: (e) => e,
      );
    }
  }
}

class ProviderError<T> extends ProviderValue<T> {
  const ProviderError(ErrorValue error)
      : this._(
          error,
          isLoading: false,
          hasValue: false,
          value: null,
        );

  const ProviderError._(
    this.error, {
    required T? value,
    required this.hasValue,
    required this.isLoading,
  })  : _value = value,
        super._();

  @override
  final bool isLoading;

  @override
  final bool hasValue;

  final T? _value;

  @override
  T? get value {
    if (!hasValue) {
      return null;
    }
    return _value;
  }

  @override
  final ErrorValue error;

  @override
  R map<R>({
    required R Function(ProviderData<T> data) data,
    required R Function(ProviderError<T> error) error,
    required R Function(ProviderLoading<T> loading) loading,
  }) {
    return error(this);
  }

  @override
  ProviderError<T> copyWithPrevious(
    ProviderValue<T> previous, {
    bool isRefresh = true,
  }) {
    return ProviderError._(
      error,
      isLoading: isLoading,
      value: previous.valueOrNull,
      hasValue: previous.hasValue,
    );
  }
}

extension ProviderValueX<T> on ProviderValue<T> {
  T get requireValue {
    if (hasValue) return value as T;
    if (hasError) {
      throw (error!);
    }

    throw StateError(
      'Tried to call `requireValue` on an `ProviderValue` that has no value: $this',
    );
  }

  T? get valueOrNull {
    if (hasValue) return value;
    return null;
  }

  bool get isRefreshing =>
      isLoading && (hasValue || hasError) && this is! ProviderLoading;

  bool get isReloading => (hasValue || hasError) && this is ProviderLoading;

  bool get hasError => error != null;

  ProviderData<T>? get asData {
    return map(
      data: (d) => d,
      error: (e) => null,
      loading: (l) => null,
    );
  }

  ProviderError? get asError => map(
        data: (_) => null,
        error: (e) => e,
        loading: (_) => null,
      );

  ProviderValue<R> whenData<R>(R Function(T value) cb) {
    return map(
      data: (d) {
        try {
          return ProviderData._(
            cb(d.value),
            isLoading: d.isLoading,
            error: d.error,
          );
        } on ErrorValue catch (err) {
          return ProviderError._(
            err,
            isLoading: d.isLoading,
            value: null,
            hasValue: false,
          );
        }
      },
      error: (e) => ProviderError._(
        e.error,
        isLoading: e.isLoading,
        value: null,
        hasValue: false,
      ),
      loading: (l) => ProviderLoading<R>(),
    );
  }

  R maybeWhen<R>({
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    R Function(T data)? data,
    R Function(ErrorValue error)? error,
    R Function()? loading,
    required R Function() orElse,
  }) {
    return when(
      skipError: skipError,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      data: data ?? (_) => orElse(),
      error: error ?? (err) => orElse(),
      loading: loading ?? () => orElse(),
    );
  }

  R when<R>({
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    required R Function(T data) data,
    required R Function(ErrorValue error) error,
    required R Function() loading,
  }) {
    if (isLoading) {
      bool skip;
      if (isRefreshing) {
        skip = skipLoadingOnRefresh;
      } else if (isReloading) {
        skip = skipLoadingOnReload;
      } else {
        skip = false;
      }
      if (!skip) return loading();
    }

    if (hasError && (!hasValue || !skipError)) {
      return error(this.error!);
    }

    return data(requireValue);
  }

  R? whenOrNull<R>({
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    R Function(T data)? data,
    R Function(ErrorValue error)? error,
    R Function()? loading,
  }) {
    return when(
      skipError: skipError,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      data: data ?? (_) => null,
      error: error ?? (err) => null,
      loading: loading ?? () => null,
    );
  }

  R maybeMap<R>({
    R Function(ProviderData<T> data)? data,
    R Function(ProviderError<T> error)? error,
    R Function(ProviderLoading<T> loading)? loading,
    required R Function() orElse,
  }) {
    return map(
      data: (d) {
        if (data != null) return data(d);
        return orElse();
      },
      error: (d) {
        if (error != null) return error(d);
        return orElse();
      },
      loading: (d) {
        if (loading != null) return loading(d);
        return orElse();
      },
    );
  }

  R? mapOrNull<R>({
    R Function(ProviderData<T> data)? data,
    R Function(ProviderError<T> error)? error,
    R Function(ProviderLoading<T> loading)? loading,
  }) {
    return map(
      data: (d) => data?.call(d),
      error: (d) => error?.call(d),
      loading: (d) => loading?.call(d),
    );
  }
}
