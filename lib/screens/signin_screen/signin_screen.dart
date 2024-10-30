import 'package:fitzone_app/common/widgets/form_widgets/header.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:fitzone_app/screens/signin_screen/widgets/form_section.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
 SignInScreen({super.key}) {
  final UserModel user1 = UserModel(
    id: 1,
    registrationId: 'reg123',
    name: 'fulano',
    nickName: 'fulanoNick',
    email: 'fulano@example.com',
    password: '123',
    cpf: '12345678900',
    registrationDate: DateTime.now(),
    level: 1,
    activities: [],
  );
  _listaUsuarios.add(user1);
}

final List<UserModel> _listaUsuarios = [];

@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
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
            FormSection(listaUsuarios: _listaUsuarios,),
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

