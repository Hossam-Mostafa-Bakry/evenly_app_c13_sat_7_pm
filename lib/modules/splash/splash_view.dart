import 'dart:async';

import 'package:evently_app_c13_sat_7pm/core/routes/page_routes_name.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          PageRoutesName.signInView,
          (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.eventlyLogo,
          height: 185,
        ),
      ),
    );
  }
}
