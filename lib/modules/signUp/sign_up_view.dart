import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/constants/app_assets.dart';
import '../../core/extensions/validations.dart';
import '../../core/theme/color_palette.dart';
import '../../core/utils/firecase_functions.dart';
import '../../core/widgets/custom_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      body: Form(
        key: formKey,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
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
                CustomTextField(
                  hint: "Name",
                  controller: nameController,
                  hintColor: ColorPalette.generalGreyColor,
                  prefixIcon: const ImageIcon(
                    AssetImage(AppAssets.personIcn),
                    color: ColorPalette.generalGreyColor,
                  ),
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "plz enter your name";
                    }

                    return null;
                  },
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                CustomTextField(
                  controller: emailController,
                  maxLines: 1,
                  hint: "Email",
                  hintColor: ColorPalette.generalGreyColor,
                  prefixIcon: const ImageIcon(
                    AssetImage(AppAssets.mailIcn),
                    color: ColorPalette.generalGreyColor,
                  ),
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "plz enter your e-mail";
                    }

                    if (!Validations.validateEmail(value)) {
                      return "enter a valid e-mail";
                    }
                    return null;
                  },
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                CustomTextField(
                  controller: passwordController,
                  isPassword: true,
                  maxLines: 1,
                  hint: "Password",
                  hintColor: ColorPalette.generalGreyColor,
                  prefixIcon: const ImageIcon(
                    AssetImage(AppAssets.lockIcn),
                    color: ColorPalette.generalGreyColor,
                  ),
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "plz enter your password";
                    }

                    if (!Validations.validatePassword(value)) {
                      return "Your Password has to follow the following: \n\t * Contains 1 Uppercase letter.\n\t * Contains 1 Lowercase letter.\n\t * Contains 1 digit.\n\t * Contains 1 Special Character.\n\t * 8 characters or more.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                CustomTextField(
                  isPassword: true,
                  maxLines: 1,
                  hint: "Re-Password",
                  hintColor: ColorPalette.generalGreyColor,
                  prefixIcon: const ImageIcon(
                    AssetImage(AppAssets.lockIcn),
                    color: ColorPalette.generalGreyColor,
                  ),
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "plz enter your password";
                    }

                    if (value != passwordController.text) {
                      return "enter a valid password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseFunctions.signUpWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                      ).then(
                        (value) {
                          EasyLoading.dismiss();
                          if (value == true) {
                            Navigator.pop(context);
                          }
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: ColorPalette.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
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
      ),
    );
  }
}
