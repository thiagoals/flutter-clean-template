import 'dart:io';
import 'package:dartz/dartz.dart';

import 'package:flutter_login_clean/app/modules/login/domain/entities/credentials.dart';
import 'package:flutter_login_clean/app/modules/login/domain/services/login_service.dart';
import 'package:flutter_login_clean/app/modules/login/errors/failure.dart';
import 'package:flutter_login_clean/app/modules/login/infra/models/logged_user_dto.dart';

class LoginUseCase{
  final LoginService loginService;

  LoginUseCase(this.loginService);

  Future<Either<Failure,LoggedUserDTO>> call(Credentials credentials) {
    var response = loginService(credentials);
    return response;
  }
}