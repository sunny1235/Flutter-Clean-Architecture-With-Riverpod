


import 'package:flutter/material.dart';
// import 'package:flutter_clean_architecture/features/authentication/login_screen.dart';
// import 'package:flutter_clean_architecture/features/authentication/registration_screen.dart';
import 'package:flutter_clean_architecture/main/Routes/rout_paths.dart';
import 'package:go_router/go_router.dart';

// import '../../features/testFeature/login_screen.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/testFeature/registration_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: RoutePaths.root,
      pageBuilder: (context, state) {
        return const MaterialPage(child: LoginScreen());
      }
    ),
    GoRoute(
      path: '/registration/:name',
      name: RoutePaths.registration,
      pageBuilder: (context, state) {
        return  MaterialPage(child: RegistrationScreen(name: state.pathParameters['name']!,));
      }
    ),
  ]);
}