import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/common/widgets/form_widgets/header.dart';
import 'package:fitzone_app/screens/register_screen/widgets/form_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 0,
          leading: _buildBackButton(),
          pinned: true, // Keeps the app bar visible at the top
          expandedHeight: 150.0, // Height for the expanded area
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              "Criar conta",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            background: Container(
              color: Theme.of(context).colorScheme.surface,
              child: const Header(title: ""),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const FormSection(),
                const SizedBox(height: 32),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      },
      tooltip: 'Toggle Theme',
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: const Icon(Icons.add),
    ),
  );
}


  Widget _buildFooter() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 32), // Bottom margin
      child: Center(
        child: Text(
          'Política de Privacidade   Termos de Serviço',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFA9AEB4),
            fontSize: 12,
            height: 1.5,
          ),
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

