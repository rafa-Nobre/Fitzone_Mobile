import 'package:fitzone_app/screens/calendar_screen/calendar_screen.dart';
import 'package:fitzone_app/screens/home_screen/home_screen.dart';
import 'package:fitzone_app/screens/register_screen/register_screen.dart';
import 'package:fitzone_app/screens/search_screen/search_screen.dart';
import 'package:fitzone_app/screens/search_screen/widget/map_page.dart';
import 'package:fitzone_app/screens/signin_screen/signin_screen.dart';
import 'package:fitzone_app/screens/workout_screen/workout_page.dart';
import 'package:flutter/widgets.dart';
import 'routes_consts.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesConsts.login: (context) =>  const SignInScreen(),
  RoutesConsts.signUp: (context) =>  const RegisterScreen(),
  RoutesConsts.home: (context) => const HomeScreen(),
  RoutesConsts.calendar: (context) => const CalendarScreen(),
  RoutesConsts.search: (context) => const SearchScreen(),
  RoutesConsts.todaysWorkout: (context) => const WorkoutPage(),
  RoutesConsts.map: (context) => const MapPage(),
};