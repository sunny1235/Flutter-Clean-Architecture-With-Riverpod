import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/configs/api_endpoints.dart';

import '../../../../shared/data/remote/network_service.dart';
import '../../../../shared/exceptions/http_exception.dart';


abstract class LoginUserDataSource {
  Future<Either<AppException, bool>> loginUser();
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkServices networkService;

  LoginUserRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, bool>> loginUser() async {
    try {
      final eitherType = await networkService.get(
        ApiEndPoints.carts,
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          // final user = User.fromJson(response.data);
          // update the token for requests
          networkService.updateHeader(
            {'Authorization': 'user.token'},
          );
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
