import 'package:flutter/material.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 32,
      left: 0,
      right: 0,
      child: Text(
        'Política de Privacidade   Termos de Serviço',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFA9AEB4),
          // color: Theme.of(context).colorScheme.secondary,
          fontSize: 12,
          height: 1.5,
        ),
      ),
    );
  }
}
