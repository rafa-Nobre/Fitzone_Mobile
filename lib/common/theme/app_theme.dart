import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: backgroundLight,
      brightness: Brightness.light,
      surface: background2Light,
      surfaceContainer: background2Light,
      primary: themeColorLight,
      secondary: themeColor2Light,
      onPrimary: textLight,
      onSecondary: textPlaceholderLight,
      onSurface: textLight,
      inversePrimary: textLight,
      onInverseSurface: textDark,
      surfaceContainerLow: borderLight
    ),
     textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: textLight,
      fontSize: 24,
    ),
    bodyLarge: TextStyle(
      color: textLight,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: textLight,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: textLight,
      fontSize: 12,
    ),
       displayLarge: TextStyle(
        color: themeColor2Light,
        fontSize: 16,
      )
  ),
   appBarTheme: AppBarTheme(
    backgroundColor: backgroundLight,
    titleTextStyle: TextStyle(
      color: textLight,
      fontSize: 18,
    ),
  ),
  
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.light(
    background: backgroundDark,
    surfaceContainer: background2Dark,
    brightness: Brightness.dark,
    surface: background2Dark,
    primary: themeColorDark,
    secondary: themeColor2Dark,
    onPrimary: textDark,
    onSecondary: textPlaceholderDark,
    onSurface: textDark,
    inversePrimary: textLight,
    onInverseSurface: textLight,
    surfaceContainerLow: borderDark
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundDark,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: textDark,
      fontSize: 24,
    ),
    bodyLarge: TextStyle(
      color: textDark,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: textDark,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: textDark,
      fontSize: 12,
    ),
    displayLarge: TextStyle(
      color: themeColor2Light,
      fontSize: 16,
    )
  ),
  fontFamily: 'Lato',

);


// ThemeData globalTheme(BuildContext context) {
//   return ThemeData(
//     primaryColor: themeColorLight,
//     colorScheme: Theme.of(context).colorScheme.copyWith(secondary: secondaryColorLight),
//     appBarTheme: AppBarTheme(
//       elevation: 0.0,
//       iconTheme: const IconThemeData(
//         color: Colors.white,
//       ),
//       color: primaryColorLight,
//       titleTextStyle: const TextStyle(
//         color: Colors.white,
//         fontSize: 18,
//       ),
//     ),
//     scaffoldBackgroundColor: Colors.white,
//     splashColor: Colors.transparent,
//     hoverColor: Colors.transparent,
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: secondaryColorLight,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//       ),
//     ),
//   );
// }