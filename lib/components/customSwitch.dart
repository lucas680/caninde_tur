import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onToggle;
  final String text;

  const CustomSwitch({
    super.key,
    required this.text,
    required this.initialValue,
    required this.onToggle,
  });

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  late bool _isSwitched;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: _isSwitched,
          onChanged: (value) {
            setState(() {
              _isSwitched = value;
              widget.onToggle(value);
            });
          },
          activeTrackColor: const Color.fromRGBO(0, 146, 63, 1),
          activeColor: Colors.white,
        ),
        Text(
          widget.text,
          style: const TextStyle(
            color: Color.fromRGBO(151, 151, 151, 1),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
