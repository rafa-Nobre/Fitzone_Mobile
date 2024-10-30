import 'package:fitzone_app/common/widgets/form_widgets/input_field.dart';
import 'package:fitzone_app/common/widgets/form_widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
   FormSection({super.key});
   
  TextEditingController _matricula = TextEditingController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _cpf = TextEditingController(); 
  TextEditingController _apelido = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _confirmarSenha = TextEditingController();

void signUp () {

}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16), // Top margin with padding
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             InputField(controller: _matricula , placeholder: 'Matrícula'),
            const SizedBox(height: 8),
            InputField(controller: _nome , placeholder: 'Nome Completo'),
            const SizedBox(height: 8),
            InputField(controller: _cpf, placeholder: 'CPF'),
            const SizedBox(height: 8),
             InputField(controller: _apelido, placeholder: 'Como você gostaria de ser chamado?'),
            const SizedBox(height: 8),
             InputField(controller:_email, placeholder: 'Email'),
            const SizedBox(height: 8),
             InputField(controller: _senha, placeholder: 'Senha', isPassword: true),
            const SizedBox(height: 8),
             InputField(controller: _confirmarSenha, placeholder: 'Confirmar senha', isPassword: true),
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
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
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
