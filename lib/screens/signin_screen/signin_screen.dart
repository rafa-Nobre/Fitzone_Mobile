import 'package:fitzone_app/common/widgets/form_widgets/header.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:fitzone_app/screens/signin_screen/widgets/form_section.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _userMock = UserModel(
    id: 1,
    registrationId: 'reg123',
    name: 'fulano',
    nickName: 'fulanoNick',
    email: 'fulano@example.com',
    password: '123',
    cpf: '12345678900',
    registrationDate: DateTime.now(),
    points: 20,
    activities: [],
  );

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color.primary,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: _color.tertiary,
        ),
        child: Stack(
          children: [
            const Header(
              title: "Bem vindo(a)!",
            ),
            FormSection(userModel: _userMock),
            _buildFooter(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
      //   },
      //   tooltip: 'Increment',
      //   fo
      //roundColor: Theme.of(context).colorScheme.inversePrimary,
      //   child: const Icon(
      //     Icons.add,
      //   ),
      // ),
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
}
