import 'package:fitzone_app/common/widgets/form_widgets/header.dart';
import 'package:fitzone_app/screens/signin_screen/widgets/form_section.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: color.tertiary,
        ),
        child:  const Stack(
          children: [
            Header(
              title: "Bem vindo(a)!",
            ),
            FormSection(),
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
}
