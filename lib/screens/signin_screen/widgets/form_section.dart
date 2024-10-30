import 'package:fitzone_app/common/widgets/form_widgets/input_field.dart';
import 'package:fitzone_app/common/widgets/form_widgets/custom_checkbox.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:fitzone_app/routes/routes_consts.dart';
import 'package:fitzone_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class FormSection extends StatefulWidget {
  const FormSection({
    super.key,  
    required this.userModel,
  });

  final UserModel userModel;

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void signIn(BuildContext context) {
    if (widget.userModel.email == _email.text &&
        widget.userModel.password == _password.text) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(usuario: widget.userModel),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => signIn(context),
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed(RoutesConsts.signUp),
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
