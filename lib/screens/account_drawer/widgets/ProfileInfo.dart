import 'package:fitzone_app/common/widgets/Photo.dart';
import 'package:flutter/material.dart';

class Profileinfo extends StatelessWidget {
  const Profileinfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Photo(),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fulano Beltrano',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'fulanobeltrano@email.com',
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
