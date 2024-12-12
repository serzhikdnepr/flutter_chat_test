

import '../../data/repositories/auth_repository.dart';

class AuthenticateUser {
  final AuthRepository authRepository;

  AuthenticateUser(this.authRepository);

  Future<String> call(String username) async {
    return await authRepository.authenticateUser(username);
  }
}
