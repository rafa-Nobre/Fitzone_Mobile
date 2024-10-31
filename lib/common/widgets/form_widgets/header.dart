import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(48)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 43, top: 40),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            letterSpacing: 1.28,
          ),
        ),
      ),
    );
  }
}
