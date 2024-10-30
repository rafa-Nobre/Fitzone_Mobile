import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/account_footer.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/level.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/menu_widget.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/profile_info.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/registration_status.dart';
import 'package:flutter/material.dart';

class AccountDrawer extends StatelessWidget {
  const AccountDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 340,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
          color: Theme.of(context).colorScheme.tertiary,
          child: const Column(
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
    );
  }
}
