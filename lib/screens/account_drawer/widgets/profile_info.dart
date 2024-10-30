import 'package:fitzone_app/common/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/models/user_model.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key, required this.profileUser,
  });

  final UserModel profileUser;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileWidget(),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profileUser.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                profileUser.email,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                "Gerenciar configurações de conta",
                style: Theme.of(context).textTheme.displayLarge,
              )
            ],
          ),
        ],
      ),
    );
  }
}
