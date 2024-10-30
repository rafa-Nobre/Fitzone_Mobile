import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/common/widgets/go_back_button.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/account_footer.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/level.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/menu_widget.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/profile_info.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/registration_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDrawer extends StatelessWidget {
  const AccountDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.tertiary,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const GoBackButton(
          title: "Conta",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        width: double.infinity,
        color: Theme.of(context).colorScheme.tertiary,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ProfileInfo(),
                  SizedBox(
                    height: defaultSpacing,
                  ),
                  RegistrationStatus(),
                  SizedBox(
                    height: largeSpacing,
                  ),
                  Level(
                    points: 100,
                  ),
                  SizedBox(
                    height: largeSpacing,
                  ),
                  MenuWidget(),
                ],
              ),
              AccountFooter()
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
