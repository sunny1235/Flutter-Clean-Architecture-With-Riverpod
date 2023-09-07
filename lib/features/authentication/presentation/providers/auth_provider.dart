import 'package:flutter_clean_architecture/features/authentication/domain/providers/login_provider.dart';
import 'package:flutter_clean_architecture/features/authentication/presentation/providers/auth_state_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/auth_repository.dart';

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthStateEnum>((ref) {
  final authRepoProvider = ref.read(authRepositoryProvider);
  return AuthNotifier(authRepository: authRepoProvider);
});



class AuthNotifier extends StateNotifier<AuthStateEnum> {
  final AuthenticationRepository authRepository;
  // final UserRepository userRepository;

  AuthNotifier({
    required this.authRepository,
    // required this.userRepository,
  }) : super(AuthStateEnum.Initial);

  Future<void> loginUser() async {
    state =  AuthStateEnum.Loading;
    final response = await authRepository.loginUser(
        // user: User(username: username, password: password),
        );

    state = await response.fold(
      (failure) => AuthStateEnum.Failure,
      (user) async {
        // final hasSavedUser = await userRepository.saveUser(user: user);
        if (user) {
          return AuthStateEnum.Success;
        }
        return AuthStateEnum.Failure;
      },
    );
  }

  void updateUI() {}
}



