import 'package:caninde_tur/components/button.dart';
import 'package:caninde_tur/components/input.dart';
import 'package:caninde_tur/components/customSwitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool savePassword = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  save() {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/logo.svg',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 25),
                  Input(
                    controller: emailController,
                    textPlaceholder: "Email",
                    onChange: (value) => {},
                    icon: Icons.email_outlined,
                    invalidText: "Email inválido!",
                  ),
                  const SizedBox(height: 12),
                  Input(
                    controller: passwordController,
                    textPlaceholder: "Senha",
                    onChange: (value) => {},
                    icon: Icons.lock,
                    type: TextInputType.visiblePassword,
                    invalidText: "Senha inválida!",
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSwitch(
                        initialValue: savePassword,
                        onToggle: (value) {
                          setState(() {
                            savePassword = value;
                          });
                        },
                        text: "Lembrar-me",
                      ),
                      const Flexible(
                        child: Text(
                          "Esqueceu sua senha?",
                          style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Button(text: "Entrar", onClick: save),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        child: Text(
                          "Ainda não tem conta?",
                          style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'signUp');
                        },
                        child: const Text(
                          "Fazer cadastro",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 146, 63, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
