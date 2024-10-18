import 'package:flutter/widgets.dart';
import 'routes_consts.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesConsts.root: (context) => const Placeholder(),
  RoutesConsts.login: (context) => const Placeholder(),
  RoutesConsts.profile: (context) => const Placeholder(),
  RoutesConsts.signUp: (context) => const Placeholder(),
  RoutesConsts.settings: (context) => const Placeholder(),
  RoutesConsts.forgetPassword: (context) => const Placeholder(),
  RoutesConsts.devInfo: (context) => const Placeholder(),
};