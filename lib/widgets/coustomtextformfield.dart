import 'package:flutter/material.dart';

class Coustomtextformfield extends StatelessWidget {
  const Coustomtextformfield(
      {super.key,
      required this.hintText,
      this.onChange,
      this.abscureText = false, this.inputType});
  final String hintText;
  final Function(String)? onChange;
  final bool? abscureText;
 final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: abscureText!,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      onChanged: onChange,
    );
  }
}
