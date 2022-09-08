import 'package:dio/dio.dart';
import 'package:flutter_login_clean/app/modules/login/external/entities/requests/LoginRequest.dart';
import 'package:flutter_login_clean/app/modules/login/external/entities/responses/LoginResponse.dart';
import 'package:flutter_login_clean/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:flutter_login_clean/app/modules/shared/external/datasources/datasource.dart';

class LoginDatasourceImpl extends Datasource implements LoginDatasource{
  String suffix = "login";

  @override
  Future<LoginResponse> call(LoginRequest loginRequest) async {
    var res = await post(suffix,loginRequest);
    return LoginResponse.fromJson(res);
  }

}