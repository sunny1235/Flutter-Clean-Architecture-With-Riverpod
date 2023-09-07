import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/http_exception.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_remote_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final LoginUserDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, bool>> loginUser() {
    return dataSource.loginUser();
  }
}
