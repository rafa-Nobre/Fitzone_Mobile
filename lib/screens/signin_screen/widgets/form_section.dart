import 'package:fitzone_app/common/constants/responses.dart';
import 'package:fitzone_app/common/widgets/form_widgets/input_field.dart';
import 'package:fitzone_app/common/widgets/form_widgets/custom_checkbox.dart';
import 'package:fitzone_app/common/widgets/snackbar_helper.dart';
import 'package:fitzone_app/data/services/auth_service.dart';
import 'package:fitzone_app/routes/routes_consts.dart';
import 'package:flutter/material.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final GlobalKey<FormState> _formController = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool obscurePassword = true;
  void setVisible() {
    setState(() {
      if(obscurePassword) {
        obscurePassword = false;
      }else {
        obscurePassword = true;
      }
    });
  }

  bool rememberMe = false;
  void checkRemember(bool? value) {
    setState(() {
      rememberMe = value ?? false;
    });
  }

  Future<void> signIn(BuildContext context) async{
    if (_formController.currentState != null) {
      if(_formController.currentState!.validate()) {
        await AuthService().signIn(email: _email.text, password: _password.text).then((response) {
          if(response == sucessMessage) {
            showSnackBar(context, "Seja bem vindo de volta!");
            Navigator.of(context).pushNamed(RoutesConsts.home);
          }else {
            showSnackBar(context, "Ocorreu algum erro ao autenticar!");
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Positioned(
      left: 0,
      right: 0,
      top: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formController,
              child: Column(
                children: [
                  InputField(
                    controller: _email,
                    placeholder: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ops, está vazio!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    controller: _password,
                    placeholder: 'Senha',
                    isPassword: obscurePassword,
                    suffixIcon: IconButton(icon: obscurePassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off), onPressed: setVisible,),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ops, está vazio!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCheckbox(isChecked: rememberMe, labelText: 'Lembrar de mim', onChanged: checkRemember,),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => signIn(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color.secondary,
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
                ],
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
                        color: color.onSurface),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      color: color.onSurface,
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
