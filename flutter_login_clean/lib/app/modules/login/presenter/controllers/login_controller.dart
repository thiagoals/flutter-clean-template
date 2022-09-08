import 'dart:io';
import 'dart:math';

import 'package:flutter_login_clean/app/modules/login/domain/entities/credentials.dart';
import 'package:flutter_login_clean/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:flutter_login_clean/app/modules/login/presenter/validators/validators.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../infra/models/logged_user_dto.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store{

  final Validators validators;
  final LoginUseCase usecase;

  _LoginControllerBase(this.validators,this.useCase);

  @observable
  String username = '';

  @action
  setUserName(String value) => username = value;

  @observable
  String password = '';

  @action
  setPassword(String value) => password = value;

  @observable
  bool isLoading = false;

  @computed
  bool get isUsernameValid =>
      validators.validateUsername(username);

  @computed
  bool get isPasswordValid =>
      validators.validatePassword(password);

  @computed
  bool get isCredentialsValid =>
      isUsernameValid && isPasswordValid;

  Credentials get credential =>
      Credentials(username: username, password: password);

  @action
  login() async{
    isLoading = true;
    var response = await usecase(credential);
    response.fold(
            (l) => null,
            (r) => null
    );
    isLoading = false;
  }
}