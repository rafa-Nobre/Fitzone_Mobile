import 'package:flutter/material.dart';

class Registrationstatus extends StatelessWidget {
  const Registrationstatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Text(
              "MATRÍCULA ATIVA",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Text(
          "VENCIMENTO EM 5 DIAS",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
