import 'package:fitzone_app/common/widgets/profile_widget.dart';
import 'package:fitzone_app/data/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileWidget(),
          const SizedBox(width: 10),
          Consumer<UserProvider>(
            builder: (context, userProviderModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userProviderModel.currentUser?.name ?? "Error_name",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    userProviderModel.currentUser?.email ?? "Error_email",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Gerenciar configurações de conta",
                    style: Theme.of(context).textTheme.displayLarge,
                  )
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}
