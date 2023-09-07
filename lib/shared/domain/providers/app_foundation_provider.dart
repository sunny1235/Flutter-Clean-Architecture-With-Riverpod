
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/remote/dio_network_service.dart';



final sharedPreferencesProvider = Provider<SharedPreferences>((_) => throw UnimplementedError());

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
      (ref) {
    // final storage = ref.watch(storageServiceProvider);
    final sharedPrefs = ref.read(sharedPreferencesProvider);

    return AppThemeModeNotifier(sharedPrefs);
  },
);

final netwokServiceProvider = Provider<DioNetworkService>(
      (ref) {
    final Dio dio = Dio();
    return DioNetworkService(dio);
  },
);



