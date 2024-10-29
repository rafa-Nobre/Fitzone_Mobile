import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Olá, "),
                TextSpan(text: "Fulano", style: TextStyle(backgroundColor: Theme.of(context).colorScheme.primary))
              ]
            )
          )
        ],
      );
  }
}