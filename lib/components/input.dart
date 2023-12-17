import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Input extends StatefulWidget {
  final String textPlaceholder;
  final Function onChange;
  final IconData icon;
  final TextInputType type;
  final String invalidText;
  final bool required;
  final TextEditingController controller;


  const Input({
    super.key,
    required this.textPlaceholder,
    required this.onChange,
    required this.icon,
    this.type = TextInputType.text,
    this.invalidText = 'Campo inválido',
    this.required = false,
    required this.controller,
  });

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      onChanged: (value) {
        widget.onChange(value);
      },
      obscureText:
          widget.type == TextInputType.visiblePassword ? _obscureText : false,
      decoration: InputDecoration(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.textPlaceholder,
              style: const TextStyle(
                color: Color.fromRGBO(151, 151, 151, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            if(widget.required)
              const Text(
                " *",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
        prefixIcon: Icon(
          widget.icon,
          size: 20.0,
          color: const Color.fromRGBO(228, 223, 223, 1)
        ),
        suffixIcon: widget.type == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: 20.0,
                  color: const Color.fromRGBO(228, 223, 223, 1),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        contentPadding: const EdgeInsets.all(16.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromRGBO(228, 223, 223, 1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromRGBO(180, 175, 175, 1.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: Colors.transparent,
        filled: true,
      ),
      style: const TextStyle(
        color: Color.fromRGBO(151, 151, 151, 1),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      validator: (value) {
        // Adicione a lógica de validação aqui
        if (value == null || value.isEmpty) {
          return widget.invalidText;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
