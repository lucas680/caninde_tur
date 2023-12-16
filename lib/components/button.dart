import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onClick;

  const Button({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 146, 63, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botão Personalizado'),
        ),
        body: Center(
          child: Button(
            text: 'Clique aqui',
            onClick: () {
              // Função a ser executada quando o botão é clicado
              print('Botão clicado!');
            },
          ),
        ),
      ),
    );
  }
}
