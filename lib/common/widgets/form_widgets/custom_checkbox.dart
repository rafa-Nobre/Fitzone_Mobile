import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String labelText;

  const CustomCheckbox({
    super.key,
    required this.labelText,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: _color.secondary,
          checkColor: _color.onInverseSurface,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Text(
          widget.labelText,
          style: TextStyle(
            color: _color.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
