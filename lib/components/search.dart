import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final String textPlaceholder;
  final Function onChange;
  final TextEditingController controller;

  const Search({
    super.key,
    required this.textPlaceholder,
    required this.onChange,
    required this.controller,
  });

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        widget.onChange(value);
      },
      decoration: InputDecoration(
        hintText: widget.textPlaceholder,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(151, 151, 151, 1),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Icon(Icons.search,
            size: 20.0, color: Color.fromRGBO(228, 223, 223, 1)),
        contentPadding: const EdgeInsets.all(16.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      style: const TextStyle(
        color: Color.fromRGBO(151, 151, 151, 1),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
