import 'package:fitzone_app/screens/calendar_screen/calendar_screen.dart';
import 'package:fitzone_app/screens/home_screen/home_screen.dart';
import 'package:fitzone_app/screens/register_screen/register_screen.dart';
import 'package:fitzone_app/screens/search_screen/search_screen.dart';
import 'package:fitzone_app/screens/signin_screen/signin_screen.dart';
import 'package:flutter/widgets.dart';
import 'routes_consts.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesConsts.root: (context) =>  SignInScreen(),
  RoutesConsts.signUp: (context) =>  RegisterScreen(listaUsuarios: [],),
  RoutesConsts.home: (context) => const HomeScreen(usuario: ,),
  RoutesConsts.calendar: (context) => const CalendarScreen(),
  RoutesConsts.search: (context) => const SearchScreen(),
};