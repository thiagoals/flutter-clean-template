import 'package:flutter_login_clean/app/modules/login/presenter/interface/login_input.dart';
import 'package:flutter_login_clean/app/modules/login/presenter/interface/login_page.dart';
import 'package:flutter_login_clean/app/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Login template',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}