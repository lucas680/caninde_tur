import 'package:caninde_tur/components/button.dart';
import 'package:caninde_tur/components/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                  textPlaceholder: "Email",
                  onChange: (value) => {},
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 12),
                Input(
                  textPlaceholder: "Senha",
                  onChange: (value) => {},
                  icon: Icons.lock,
                  type: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20),
                Button(text: "Entrar", onClick: () => {}),
                // Adicione mais widgets aqui, se necessário
              ],
            ),
          ),
        ),
      ),
    );
  }
}
