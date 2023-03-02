part of 'access_logs_cubit.dart';

enum AccessLogsStatus { loading, success, failure }

class AccessLogsState extends Equatable {
  const AccessLogsState({
    this.status = AccessLogsStatus.loading,
    this.accessLogs = const [],
    this.error,
  });

  bool get isLoading => status == AccessLogsStatus.loading;
  bool get isSuccess => status == AccessLogsStatus.success;
  bool get isFailure => status == AccessLogsStatus.failure;

  final AccessLogsStatus status;
  final List<AccessLog> accessLogs;
  final String? error;

  AccessLogsState copyWith({
    AccessLogsStatus? status,
    List<AccessLog>? accessLogs,
    String? error,
  }) {
    return AccessLogsState(
      status: status ?? this.status,
      accessLogs: accessLogs ?? this.accessLogs,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        accessLogs,
        error,
      ];
}
