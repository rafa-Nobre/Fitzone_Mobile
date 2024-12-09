import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String placeholder;
  final bool isPassword;
  final bool readOnlyField;
  final TextEditingController _controller;
  final String? Function(String?)? validator;
  final int? length;
  final Widget? suffixIcon;

  const InputField({
    super.key,
    required TextEditingController controller,
    required this.placeholder,
    this.length,
    this.readOnlyField = false,
    this.isPassword = false,
    this.validator,
    this.suffixIcon,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: length,
      readOnly: readOnlyField,
      validator: validator,
      obscureText: isPassword,
      controller: _controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
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
