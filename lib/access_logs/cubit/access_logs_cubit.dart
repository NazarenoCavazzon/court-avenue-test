import 'package:bloc/bloc.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:equatable/equatable.dart';

part 'access_logs_state.dart';

class AccessLogsCubit extends Cubit<AccessLogsState> {
  AccessLogsCubit({
    required this.dataPersistence,
  }) : super(const AccessLogsState());

  Future<void> getAccessLogs() async {
    emit(state.copyWith(status: AccessLogsStatus.loading));
    try {
      final accessLogs = await dataPersistence.getLogs();
      if (accessLogs != null) {
        emit(
          state.copyWith(
            status: AccessLogsStatus.success,
            accessLogs: accessLogs,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          status: AccessLogsStatus.failure,
          error: "couldn't get access logs",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AccessLogsStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  final DataPersistence dataPersistence;
}
