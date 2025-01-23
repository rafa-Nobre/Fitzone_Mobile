import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/data/providers/user_provider.dart';
import 'package:fitzone_app/data/providers/workout_provider.dart';
import 'package:fitzone_app/data/services/notification_service.dart';
import 'package:fitzone_app/routes/app_routes.dart';
import 'package:fitzone_app/screens/home_screen/home_screen.dart';
import 'package:fitzone_app/screens/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Geolocator.requestPermission();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => WorkoutProvider()),
        // Provider<NotificationService>(create: (context) => NotificationService()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// showNotification (){
//   setState(() {
    
//     if (valor){
//       Provider.of<NotificationService>(context, listen: false).showNotification(
//         CustomNotification(
//           title: 'FitZone',
//           body: 'Time to workout!',
//           payload: RoutesConsts().todaysWorkout,
//         ),
//       );
//     }
//   })
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitZone',
      routes: Routes().appRoutes,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return const HomeScreen();
          }else {
            return const SignInScreen();
          }
        },
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}