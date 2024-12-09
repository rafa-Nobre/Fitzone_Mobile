import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String labelText;
  final bool isChecked;
  final void Function(bool?)? onChanged;

  const CustomCheckbox({
    super.key,
    required this.labelText,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Row(
      children: [
        Checkbox(
          value: widget.isChecked,
          activeColor: color.secondary,
          checkColor: color.onInverseSurface,
          onChanged: widget.onChanged,
        ),
        Text(
          widget.labelText,
          style: TextStyle(
            color: color.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
