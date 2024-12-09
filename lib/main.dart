import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/data/providers/user_provider.dart';
import 'package:fitzone_app/data/providers/workout_provider.dart';
import 'package:fitzone_app/routes/app_routes.dart';
import 'package:fitzone_app/screens/home_screen/home_screen.dart';
import 'package:fitzone_app/screens/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => WorkoutProvider()),
      ],
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
      home: ChangeNotifierProvider(
        create:(context) => UserProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return const HomeScreen();
            }else {
              return const SignInScreen();
            }
          },
        ),
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}