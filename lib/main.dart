import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:fitzone_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

UserModel? user;

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
      debugShowCheckedModeBanner: false,
      title: 'FitZone',
      routes: appRoutes,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}