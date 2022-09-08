import 'package:flutter_login_clean/app/modules/login/domain/entities/credentials.dart';
import 'package:flutter_login_clean/app/modules/login/external/entities/requests/LoginRequest.dart';
import 'package:flutter_login_clean/app/modules/login/external/entities/responses/LoginResponse.dart';

class LoggedUserDTO{
  final String? username;
  final String? token;

  LoggedUserDTO({required this.username, required this.token});

  factory LoggedUserDTO.from(LoginResponse loginResponse, Credentials credentials) =>
      LoggedUserDTO(username: credentials.username, token: loginResponse.token);
}