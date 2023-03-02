import 'package:bloc/bloc.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.dataPersistence}) : super(const LoginState());

  Future<void> login({required String username}) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final accessLog = await dataPersistence.createLog(username);
      if (accessLog != null) {
        emit(
          state.copyWith(
            status: LoginStatus.success,
            accessLog: accessLog,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          error: "couldn't create access log",
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  final DataPersistence dataPersistence;
}
