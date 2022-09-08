import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_login_clean/app/modules/login/domain/entities/credentials.dart';
import 'package:flutter_login_clean/app/modules/login/domain/repositories/login_repository.dart';
import 'package:flutter_login_clean/app/modules/login/domain/services/login_service.dart';
import 'package:flutter_login_clean/app/modules/login/errors/failure.dart';
import 'package:flutter_login_clean/app/modules/login/infra/models/logged_user_dto.dart';

class LoginServiceImpl implements LoginService{
  LoginRepository loginRepository;

  LoginServiceImpl(this.loginRepository);

  @override
  Future<Either<Failure, LoggedUserDTO>> call(Credentials credentials) async{
    return await loginRepository(credentials);
  }
}