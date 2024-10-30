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
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: Theme.of(context).colorScheme.secondary,
          checkColor: Theme.of(context).colorScheme.onSurface,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Text(
          widget.labelText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
