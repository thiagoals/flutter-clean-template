import 'package:flutter_login_clean/app/modules/login/errors/failure.dart';
// ignore: empty_constructor_bodies

class LoginError extends Failure {
  final String message;
  LoginError({required this.message});
}