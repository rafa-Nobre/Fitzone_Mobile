import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/common/widgets/GoBackButton.dart';
import 'package:fitzone_app/screens/conta_screen/widgets/Footer.dart';
import 'package:fitzone_app/screens/conta_screen/widgets/Level.dart';
import 'package:fitzone_app/screens/conta_screen/widgets/Menu.dart';
import 'package:fitzone_app/screens/conta_screen/widgets/ProfileInfo.dart';
import 'package:fitzone_app/screens/conta_screen/widgets/RegistrationStatus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContaScreen extends StatelessWidget {
  const ContaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const GoBackButton(title: "Conta",),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                const Profileinfo(),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const Registrationstatus(),
                  const SizedBox(
                    height: largeSpacing,
                  ),
                  Level(points: 100,),
                  const SizedBox(
                    height: largeSpacing,
                  ),
                  const Menu(),
              ],),
              const Footer()
            ],
          ),
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
}

