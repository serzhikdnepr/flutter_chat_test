import 'package:bloc/bloc.dart';

import '../../../domain/usecases/authenticate_user.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUser authenticateUser;

  AuthBloc({required this.authenticateUser}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final token = await authenticateUser(event.username);
      emit(Authenticated(token: token));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
