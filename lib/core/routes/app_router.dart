import 'package:evently_app_c13_sat_7pm/core/routes/page_routes_name.dart';
import 'package:evently_app_c13_sat_7pm/modules/forgetPassword/forget_password_view.dart';
import 'package:evently_app_c13_sat_7pm/modules/signIn/sign_in_view.dart';
import 'package:evently_app_c13_sat_7pm/modules/signUp/sign_up_view.dart';
import 'package:evently_app_c13_sat_7pm/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashView(),
            settings: settings,
          );
        }

      case PageRoutesName.signInView:
        {
          return MaterialPageRoute(
            builder: (context) => const SignInView(),
            settings: settings,
          );
        }

      case PageRoutesName.signUpView:
        {
          return MaterialPageRoute(
            builder: (context) => const SignUpView(),
            settings: settings,
          );
        }

      case PageRoutesName.forgetPassword:
        {
          return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView(),
            settings: settings,
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashView(),
            settings: settings,
          );
        }
    }
  }
}
