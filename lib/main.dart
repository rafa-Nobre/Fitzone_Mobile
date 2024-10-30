
import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/screens/account_drawer/account_drawer.dart';
import 'package:fitzone_app/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitZone',
      home:  const MyHomePage(title: 'Flutter Demo Home Page'),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        padding:  EdgeInsets.only(left: 24, right: 24),
        child:  SearchScreen()),
    );
  }
}