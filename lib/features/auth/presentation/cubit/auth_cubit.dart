import 'package:bite/features/auth/data/repo/auth_repo.dart';
import 'package:bite/features/auth/presentation/cubit/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(LoginInitialState());

  Future<void> signin({required String password, required String email}) async {
    emit(LoginLoadingState());
    final res = await authRepo.signIn(password: password, email: email);
    res.fold(
      (error) {
        emit(LoginErrorState(error: error.toString()));
      },
      (success) {
        emit(LoginSuccessState());
      },
    );
  }

  Future<void> signup({
    required String password,
    required String email,
    required String name,
  }) async {
    emit(SignupLoadingState());
    final res = await authRepo.signUp(
      password: password,
      email: email,
      name: name,
    );
    res.fold(
      (error) {
        emit(SignupErrorState(error: error.toString()));
      },
      (success) {
        emit(SignupSuccessState());
      },
    );
  }
}
