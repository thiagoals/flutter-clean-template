import 'package:flutter/material.dart';
import 'package:flutter_login_clean/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginInput extends StatefulWidget{
  const LoginInput({super.key});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

// ignore: deprecated_member_use
class _LoginInputState extends State<LoginInput>{

  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Observer(
            builder: (_) => TextField(
              onChanged: (value) => controller.username = value,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Digite seu e-mail',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.email),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.only(left:30.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        Center(
          child: Observer(
            builder: (_) => TextField(
              onChanged: (value) => controller.password = value,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Digite sua senha',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.password),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.only(left:30.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          )
        ),
        const SizedBox(height: 30.0),
        Center(
          child: Observer(
            builder: (_) =>
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(left:50,right:50,top:15,bottom:15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.white)
                      )
                  )
              ),
              child: const Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed:
                controller.isCredentialsValid?
                    (){controller.login(context);}
                    : null
            ),
          )
        ),
        const Padding(padding: EdgeInsets.only(top:20)),
        Observer(
            builder: (_) =>
              controller.isLoading?
                const Center(
                  child: SpinKitRotatingCircle(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ): const Center(
                child: Text(
                  'Esqueceu sua senha? Clique aqui',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
          ),
      ]
    );
  }

}