import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/common/widgets/form_widgets/InputField.dart';
import 'package:fitzone_app/common/widgets/form_widgets/custom_checkbox.dart';
import 'package:fitzone_app/common/widgets/form_widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            const Header(title: "Bem vindo(a)!",),
            _buildForm(context),
            _buildFooter(),
            _buildBackButton(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
        tooltip: 'Increment',
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16), // Add 16px padding here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputField(placeholder: 'Email'),
            const SizedBox(height: 16),
            const InputField(placeholder: 'Senha', isPassword: true),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomCheckbox(labelText: "Lembrar de mim",),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
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
                // Other widgets here, like a checkbox or label
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

  Widget _buildFooter() {
    return const Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Text(
        'Política de Privacidade   Termos de Serviço',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFA9AEB4),
          fontSize: 12,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 40,
      left: 16,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }
}

