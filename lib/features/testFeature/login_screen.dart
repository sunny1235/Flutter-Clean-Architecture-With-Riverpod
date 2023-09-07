import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/main/Routes/rout_paths.dart';
import 'package:flutter_clean_architecture/main/environment/app_env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/domain/providers/app_foundation_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sf = ref.read(sharedPreferencesProvider);
    final themeProvider = ref.watch(appThemeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Login Screen ${sf.getString('theme')}'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // context.goNamed(RoutePaths.registration,
            //     pathParameters: {'name': 'john'});
            themeProvider.toggleTheme();
            themeProvider.getCurrentTheme();
          },
          child: Text(EnvInfo.envName),
        ),
      ),
    );
  }
}
