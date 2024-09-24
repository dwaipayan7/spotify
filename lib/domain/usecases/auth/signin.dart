

import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecases/usercase.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/repository/auth/auth_repository.dart';

import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either,SigninUserReq>{

  @override
  Future<Either> call({ SigninUserReq? params}) async{
    return sl<AuthRepository>().signin(params!);
  }

}
