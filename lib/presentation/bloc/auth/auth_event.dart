part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String username;

  const LoginRequested({required this.username});

  @override
  List<Object> get props => [username];
}
