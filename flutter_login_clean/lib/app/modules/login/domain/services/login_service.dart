import 'package:dartz/dartz.dart';
import 'package:flutter_login_clean/app/modules/login/domain/entities/credentials.dart';
import 'package:flutter_login_clean/app/modules/login/errors/failure.dart';
import 'package:flutter_login_clean/app/modules/login/infra/models/logged_user_dto.dart';

abstract class LoginService{
  Future<Either<Failure, LoggedUserDTO>> call(Credentials credentials);
}