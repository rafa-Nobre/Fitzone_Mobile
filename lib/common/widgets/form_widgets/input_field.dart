import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String placeholder;
  final bool isPassword;
  TextEditingController _controller;

   InputField({
    super.key,
    required TextEditingController controller,
    required this.placeholder,
    this.isPassword = false,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: _controller,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA9AEB4)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA9AEB4)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
