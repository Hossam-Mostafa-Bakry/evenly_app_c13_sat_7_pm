import 'package:evently_app_c13_sat_7pm/core/constants/app_assets.dart';
import 'package:evently_app_c13_sat_7pm/core/extensions/padding_ext.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forget Password",
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            AppAssets.forgetPasswordImg,
          ),
        ],
      ).setHorizontalPadding(context, 0.05),
    );
  }
}
