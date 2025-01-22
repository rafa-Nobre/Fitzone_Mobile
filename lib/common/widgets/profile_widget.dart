import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.grey),
      child: const Icon(Icons.person),
    );
  }
}
