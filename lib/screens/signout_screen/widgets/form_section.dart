import 'package:fitzone_app/common/widgets/form_widgets/InputField.dart';
import 'package:fitzone_app/common/widgets/form_widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16), // Top margin with padding
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputField(placeholder: 'Matrícula'),
            const SizedBox(height: 8),
            const InputField(placeholder: 'Nome Completo'),
            const SizedBox(height: 8),
            const InputField(placeholder: 'CPF'),
            const SizedBox(height: 8),
            const InputField(placeholder: 'Como você gostaria de ser chamado?'),
            const SizedBox(height: 8),
            const InputField(placeholder: 'Email'),
            const SizedBox(height: 8),
            const InputField(placeholder: 'Senha', isPassword: true),
            const SizedBox(height: 8),
            const InputField(placeholder: 'Confirmar senha', isPassword: true),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCheckbox(labelText: 'Aceito os termos e condições'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Registrar-se',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Já possui uma conta?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Entrar',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
