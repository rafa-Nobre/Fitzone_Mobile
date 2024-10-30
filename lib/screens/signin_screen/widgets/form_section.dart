import 'package:fitzone_app/common/widgets/form_widgets/input_field.dart';
import 'package:fitzone_app/common/widgets/form_widgets/custom_checkbox.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:fitzone_app/routes/routes_consts.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {

final List<UserModel> _listaUsuarios;

   FormSection({
    super.key,  
    required List<UserModel> listaUsuarios,
  }) : _listaUsuarios = listaUsuarios;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void signIn() {
      for (var user in _listaUsuarios) {
        if (user.email == _email.text && user.password == _password.text) {
          Navigator.of(context).pushNamed(RoutesConsts.home, arguments: user);
          
        }
      }
   
    }

    return Positioned(
      left: 0,
      right: 0,
      top: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             InputField(controller: _email, placeholder: 'Email'),
            const SizedBox(height: 16),
             InputField(controller: _password, placeholder: 'Senha', isPassword: true),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCheckbox(labelText: 'Lembrar de mim'),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: signIn,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Entrar',
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
                TextButton(
                  onPressed:  () => Navigator.of(context)
                  .pushNamed(
                    RoutesConsts.signUp,
                    arguments:  _listaUsuarios),
                  child: Text(
                    "Registrar-se",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 12,
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
