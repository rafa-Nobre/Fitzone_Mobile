import 'package:fitzone_app/common/constants/responses.dart';
import 'package:fitzone_app/common/widgets/form_widgets/input_field.dart';
import 'package:fitzone_app/common/widgets/form_widgets/custom_checkbox.dart';
import 'package:fitzone_app/common/widgets/snackbar_helper.dart';
import 'package:fitzone_app/data/services/auth_service.dart';
import 'package:flutter/material.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final GlobalKey<FormState> _formController = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _cpf = TextEditingController(); 
  final TextEditingController _apelido = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final TextEditingController _confirmarSenha = TextEditingController();

  bool termsIsChecked = false;
  void checkTerms(bool? value) {
    setState(() {
      termsIsChecked = value ?? false;
    });
  }

  Future<void> signUpUser(BuildContext context) async {
    if (_formController.currentState != null) {
      if (_formController.currentState!.validate() && termsIsChecked) {
        await AuthService().signUp(
          email: _email.text,
          password: _senha.text,
          name: _nome.text,
          cpf: _cpf.text,
          nickname: _apelido.text,
        ).then((response) {
          if (response == sucessMessage) {
            showSnackBar(context, "Cadastro feito com sucesso!");
            Navigator.of(context).pop();
          } else {
            showSnackBar(context, "Algum erro inesperado ocorreu!");
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                controller: _nome,
                placeholder: 'Nome Completo',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório!";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              InputField(
                controller: _cpf,
                placeholder: 'CPF',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório!";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              InputField(
                controller: _apelido,
                placeholder: 'Como você gostaria de ser chamado?',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório!";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              InputField(
                controller: _email,
                placeholder: 'Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório!";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              InputField(
                controller: _senha,
                placeholder: 'Senha',
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório!";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              InputField(
                controller: _confirmarSenha,
                placeholder: 'Confirmar senha',
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório!";
                  } else if(value != _senha.text) {
                    return "As senhas não são iguais";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCheckbox(isChecked: termsIsChecked, labelText: 'Aceito os termos e condições', onChanged: checkTerms,),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => signUpUser(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color.secondary,
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
                      color: color.onSurface,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        color: color.secondary,
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
      ),
    );
  }
}
