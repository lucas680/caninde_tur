import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Input extends StatefulWidget {
  final String textPlaceholder;
  final Function onChange;
  final IconData icon;
  final TextInputType type;
  final String invalidText;

  const Input({
    super.key,
    required this.textPlaceholder,
    required this.onChange,
    required this.icon,
    this.type = TextInputType.text,
    this.invalidText = 'Campo inválido',
  });

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  bool _obscureText = true;
  bool _isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      keyboardType: widget.type,
      onChanged: (value) {
        widget.onChange(value);
      },
      onTapOutside: (sla){
        setState(() {
          _isFocused = false;
        });
        FocusScope.of(context).requestFocus(FocusNode());
      },
      obscureText:
          widget.type == TextInputType.visiblePassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.textPlaceholder,
        hintStyle: TextStyle(
          color: _isFocused
              ? const Color.fromRGBO(0, 146, 63, 1)
              : const Color.fromRGBO(151, 151, 151, 1),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(
          widget.icon,
          size: 20.0,
          color: _isFocused
              ? const Color.fromRGBO(0, 146, 63, 1)
              : const Color.fromRGBO(228, 223, 223, 1),
        ),
        suffixIcon: widget.type == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: 20.0,
                  color: _isFocused
                      ? const Color.fromRGBO(0, 146, 63, 1)
                      : const Color.fromRGBO(228, 223, 223, 1),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                    setState(() {
                      _isFocused = true;
                    });
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
          borderSide: const BorderSide(color: Color.fromRGBO(0, 146, 63, 1)),
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
      style: TextStyle(
        color: _isFocused
            ? const Color.fromRGBO(0, 146, 63, 1)
            : const Color.fromRGBO(151, 151, 151, 1),
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
      onTap: () {
        setState(() {
          _isFocused = true;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          _isFocused = false;
        });
      },
    );
  }
}
