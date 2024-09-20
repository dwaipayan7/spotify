

import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecases/usercase.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/repository/auth/auth_repository.dart';

import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either,CreateUserReq>{
  @override
  Future<Either> call({ CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }

}
