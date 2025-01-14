import 'package:evently_app_c13_sat_7pm/core/routes/app_router.dart';
import 'package:evently_app_c13_sat_7pm/core/theme/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 1- Localization
// 2- theme mode
// 3- state management (provider)
// 4- Firebase (firebase auth)
// 5- Logging in with Google
// 6-Firebase (fireStore) CRUD Operation

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
