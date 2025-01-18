import 'package:bot_toast/bot_toast.dart';
import 'package:evently_app_c13_sat_7pm/core/routes/app_router.dart';
import 'package:evently_app_c13_sat_7pm/core/services/loading_service.dart';
import 'package:evently_app_c13_sat_7pm/core/theme/app_theme_manager.dart';
import 'package:evently_app_c13_sat_7pm/core/utils/firecase_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';

// 1- Localization
// 2- theme mode
// 3- state management (provider)
// 4- Firebase (firebase auth)
// 5- Logging in with Google
// 6-Firebase (fireStore) CRUD Operation

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}
