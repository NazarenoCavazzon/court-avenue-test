import 'package:bloc/bloc.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.dataPersistence}) : super(const LoginState());

  Future<void> login(String username) async {
    if (state.isLoading) return;
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final accessLog = await dataPersistence.createLog(username);
      emit(
        state.copyWith(
          status: LoginStatus.success,
          accessLog: accessLog,
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
