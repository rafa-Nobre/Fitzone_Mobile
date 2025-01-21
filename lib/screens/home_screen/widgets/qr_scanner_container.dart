import 'package:flutter/material.dart';

import '../../scanner_screen/scanner_screen.dart';

class QRScannerContainer extends StatelessWidget {
  const QRScannerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color.surfaceContainer, borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScannerScreen())),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code),
            SizedBox(width: 8),
            Text("Registrar presença")
        ],),
      ),
    );
  }
}