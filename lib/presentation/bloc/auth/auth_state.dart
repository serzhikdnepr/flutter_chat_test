part of 'auth_bloc.dart';


abstract class AuthState {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String token;

  const Authenticated({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

