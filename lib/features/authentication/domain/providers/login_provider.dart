
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/remote/network_service.dart';
import '../../../../shared/domain/providers/app_foundation_provider.dart';
import '../../data/datasource/auth_remote_data_source.dart';
import '../../data/repositories/atuhentication_repository_impl.dart';
import '../repositories/auth_repository.dart';

final authdataSourceProvider =
    Provider.family<LoginUserDataSource, NetworkServices>(
  (_, networkService) => LoginUserRemoteDataSource(networkService),
);

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) {
    final NetworkServices networkService = ref.watch(netwokServiceProvider);
    final LoginUserDataSource dataSource =
        ref.watch(authdataSourceProvider(networkService));
    return AuthenticationRepositoryImpl(dataSource);
  },
);
