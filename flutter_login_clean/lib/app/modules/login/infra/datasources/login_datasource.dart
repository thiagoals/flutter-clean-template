import 'package:flutter_login_clean/app/modules/login/external/entities/requests/LoginRequest.dart';
import 'package:flutter_login_clean/app/modules/login/external/entities/responses/LoginResponse.dart';

abstract class LoginDatasource{
  Future<LoginResponse> call(LoginRequest loginRequest);
}