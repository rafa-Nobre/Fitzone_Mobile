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
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.red),
          ),
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
