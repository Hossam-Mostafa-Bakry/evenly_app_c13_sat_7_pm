import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/color_palette.dart';
import '../../core/widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Register",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.eventlyLogo,
                height: mediaQuery.size.height * 0.2,
              ),
              SizedBox(height: mediaQuery.size.height * 0.05),
              const CustomTextField(
                hint: "Name",
                hintColor: ColorPalette.generalGreyColor,
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.personIcn),
                  color: ColorPalette.generalGreyColor,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              const CustomTextField(
                maxLines: 1,
                hint: "Email",
                hintColor: ColorPalette.generalGreyColor,
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.mailIcn),
                  color: ColorPalette.generalGreyColor,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              const CustomTextField(
                isPassword: true,
                maxLines: 1,
                hint: "Password",
                hintColor: ColorPalette.generalGreyColor,
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.lockIcn),
                  color: ColorPalette.generalGreyColor,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              const CustomTextField(
                isPassword: true,
                maxLines: 1,
                hint: "Password",
                hintColor: ColorPalette.generalGreyColor,
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.lockIcn),
                  color: ColorPalette.generalGreyColor,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: ColorPalette.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0))),
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already Have Account ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: ColorPalette.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 1.5,
                          decorationColor: ColorPalette.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
