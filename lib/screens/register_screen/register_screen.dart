import 'package:fitzone_app/common/widgets/form_widgets/header.dart';
import 'package:fitzone_app/screens/register_screen/widgets/form_section.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: color.tertiary,
            elevation: 0,
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Criar conta",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              background: Container(
                color: color.tertiary,
                child: const Header(title: ""),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: color.tertiary,
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      //   },
      //   tooltip: 'Toggle Theme',
      //   foregroundColor: color.inversePrimary,
      //   child: const Icon(Icons.add),
      // ),
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
}
