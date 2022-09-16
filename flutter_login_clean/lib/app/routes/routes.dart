import 'package:flutter_login_clean/app/modules/login/domain/entities/credentials.dart';
import 'package:flutter_login_clean/app/modules/login/domain/repositories/login_repository.dart';
import 'package:flutter_login_clean/app/modules/login/domain/services/login_service.dart';
import 'package:flutter_login_clean/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:flutter_login_clean/app/modules/login/external/datasources/login_datasource.dart';
import 'package:flutter_login_clean/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:flutter_login_clean/app/modules/login/infra/repositories/login_repository.dart';
import 'package:flutter_login_clean/app/modules/login/infra/services/login_service.dart';
import 'package:flutter_login_clean/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:flutter_login_clean/app/modules/login/presenter/validators/validators.dart';
import 'package:flutter_login_clean/app/modules/shared/presenter/interface/toaster.dart';
import 'package:flutter_login_clean/main.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Routes extends Module{
  @override
  List<Bind> get binds => [
    // Singletons
    Bind.singleton<Validators>((i) => Validators()),
    Bind.singleton<Toaster>((i) => Toaster()),
    // Login
    Bind.factory<LoginDatasource>((i) => LoginDatasourceImpl()),
    Bind.factory<LoginRepository>((i) => LoginRepositoryImpl(i())),
    Bind.factory<LoginService>((i) => LoginServiceImpl(i())),
    Bind.factory<LoginUseCase>((i) => LoginUseCase(i())),
    Bind.factory<LoginController>((i) => LoginController(i(),i(),i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const MyApp()),
  ];
}