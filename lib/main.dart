import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/main/app_foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main/environment/app_env.dart';
import 'main/environment/observers.dart';
import 'shared/domain/providers/app_foundation_provider.dart';

void main() => mainCommon(AppEnvironment.PROD);
Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
    ],
    observers: [
      Observers(),
    ],
    child: const AppFoundation(),
  ));
}
