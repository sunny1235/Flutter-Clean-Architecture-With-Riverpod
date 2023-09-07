import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/http_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, bool>> loginUser();
}
