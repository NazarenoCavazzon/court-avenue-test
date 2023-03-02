part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.accessLog,
    this.error,
  });

  bool get isInitial => status == LoginStatus.initial;
  bool get isLoading => status == LoginStatus.loading;
  bool get isSuccess => status == LoginStatus.success;
  bool get isFailure => status == LoginStatus.failure;

  final LoginStatus status;
  final String? error;
  final AccessLog? accessLog;

  LoginState copyWith({
    LoginStatus? status,
    String? error,
    AccessLog? accessLog,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
      accessLog: accessLog ?? this.accessLog,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        accessLog,
      ];
}
