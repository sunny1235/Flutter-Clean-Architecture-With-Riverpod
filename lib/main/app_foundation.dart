import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/main/Routes/app_router.dart';
import 'package:flutter_clean_architecture/main/environment/app_env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/domain/providers/app_foundation_provider.dart';
import '../theme/app_theme.dart';


class AppFoundation extends ConsumerWidget {
  const AppFoundation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      title: 'Flutter TDD',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate ,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      debugShowCheckedModeBanner: EnvInfo.isProduction ? false : true,
    );
  }
}
