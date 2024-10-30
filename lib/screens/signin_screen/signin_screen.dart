import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/common/widgets/form_widgets/header.dart';
import 'package:fitzone_app/screens/signin_screen/widgets/form_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: _buildBackButton(),
      ),
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
            const FormSection(),
             _buildFooter(),
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

  Widget _buildFooter() {
    return const Positioned(
      bottom: 32,
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

