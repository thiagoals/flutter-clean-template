import 'package:dartz/dartz.dart';
import 'package:flutter_login_clean/app/modules/login/domain/entities/credentials.dart';
import 'package:flutter_login_clean/app/modules/login/domain/repositories/login_repository.dart';
import 'package:flutter_login_clean/app/modules/login/errors/failure.dart';
import 'package:flutter_login_clean/app/modules/login/external/entities/requests/LoginRequest.dart';
import 'package:flutter_login_clean/app/modules/login/external/entities/responses/LoginResponse.dart';
import 'package:flutter_login_clean/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:flutter_login_clean/app/modules/login/infra/models/logged_user_dto.dart';
import '../../errors/login_error.dart';

class LoginRepositoryImpl implements LoginRepository{

  final LoginDatasource datasource;
  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure,LoggedUserDTO>> call(Credentials credentials) async {
    try{
      LoginResponse response = await datasource(LoginRequest(username: credentials.username,password: credentials.password));
      return Right(LoggedUserDTO.from(response, credentials));
    }catch(e){
      return Left(LoginError(message: "Ocorreu um erro ao tentar logar: ${e.toString()}"));
    }
  }
}