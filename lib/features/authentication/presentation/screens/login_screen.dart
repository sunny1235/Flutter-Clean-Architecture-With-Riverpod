import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/authentication/presentation/providers/auth_state_enum.dart';
import 'package:flutter_clean_architecture/main/environment/app_env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final sf = ref.read(sharedPreferencesProvider);
    // final themeProvider = ref.watch(appThemeProvider.notifier);
    final authProviderState = ref.watch(authStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // context.goNamed(RoutePaths.registration,
                //     pathParameters: {'name': 'john'});
                // themeProvider.toggleTheme();
                // themeProvider.getCurrentTheme();
              },
              child: Text(EnvInfo.envName),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  if(authProviderState != AuthStateEnum.Loading) {
                    ref.read(authStateNotifierProvider.notifier).loginUser();
                  }
                },
                child: authProviderState == AuthStateEnum.Loading
                    ? const CircularProgressIndicator(
                        color: Colors.red,
                      )
                    : const Text('Login'),),

          ],
        ),
      ),
    );
  }
}




