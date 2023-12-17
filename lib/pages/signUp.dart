import 'package:caninde_tur/components/button.dart';
import 'package:caninde_tur/components/input.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool savePassword = false;

  final formKey = GlobalKey<FormState>();

  final cityController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  save() {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        leading: InkResponse(
          onTap: () {
            Navigator.pop(context);
          },
          highlightShape: BoxShape.circle,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(60, 59, 79, 1),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                InkResponse(
                  onTap: (){},
                  highlightShape: BoxShape.circle,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 146, 63, 1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Input(
                  controller: cityController,
                  textPlaceholder: "Cidade",
                  onChange: (value) => {},
                  icon: Icons.location_on_outlined,
                  required: true,
                ),
                const SizedBox(height: 12),
                Input(
                  controller: nameController,
                  textPlaceholder: "Nome",
                  onChange: (value) => {},
                  icon: Icons.person,
                  required: true,
                ),
                const SizedBox(height: 12),
                Input(
                  controller: emailController,
                  textPlaceholder: "Email",
                  onChange: (value) => {},
                  icon: Icons.mail,
                  required: true,
                ),
                const SizedBox(height: 12),
                Input(
                  controller: passwordController,
                  textPlaceholder: "Senha",
                  onChange: (value) => {},
                  icon: Icons.lock,
                  type: TextInputType.visiblePassword,
                  required: true,
                ),
                const SizedBox(height: 12),
                Input(
                  controller: password2Controller,
                  textPlaceholder: "Confirmar Senha",
                  onChange: (value) => {},
                  icon: Icons.lock,
                  type: TextInputType.visiblePassword,
                  required: true,
                ),
                const SizedBox(height: 20),
                Button(text: "Entrar", onClick: () => {}),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
