import 'package:evently_app_c13_sat_7pm/core/constants/app_assets.dart';
import 'package:evently_app_c13_sat_7pm/core/extensions/center_ext.dart';
import 'package:evently_app_c13_sat_7pm/core/extensions/validations.dart';
import 'package:evently_app_c13_sat_7pm/core/routes/page_routes_name.dart';
import 'package:evently_app_c13_sat_7pm/core/theme/color_palette.dart';
import 'package:evently_app_c13_sat_7pm/core/utils/firecase_functions.dart';
import 'package:evently_app_c13_sat_7pm/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
        child: Form(
          key: formKey,
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
                controller: emailController,
                hint: "Email",
                hintColor: ColorPalette.generalGreyColor,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your e-mail";
                  }

                  if (!Validations.validateEmail(value)) {
                    return "enter a valid e-mail";
                  }
                  return null;
                },
                prefixIcon: const ImageIcon(
                  AssetImage(AppAssets.mailIcn),
                  color: ColorPalette.generalGreyColor,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              CustomTextField(
                controller: passwordController,
                isPassword: true,
                maxLines: 1,
                hint: "Password",
                hintColor: ColorPalette.generalGreyColor,
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.lockIcn),
                  color: ColorPalette.generalGreyColor,
                ),
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your password";
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageRoutesName.forgetPassword);
                  },
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                  ),
                  child: Text(
                    "Forget Password?",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorPalette.primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 1.5,
                        decorationColor: ColorPalette.primaryColor),
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    FirebaseFunctions.signInWithEmailAndPassword(
                            emailController.text, passwordController.text)
                        .then((value) {
                      EasyLoading.dismiss();
                      if (value == true) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          PageRoutesName.layout,
                          (route) => false,
                        );
                      }
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: ColorPalette.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0))),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t Have Account ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRoutesName.signUpView);
                    },
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                          color: ColorPalette.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 1.5,
                          decorationColor: ColorPalette.primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.size.height * 0.01),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 20,
                      indent: 20,
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                  Text(
                    "Or",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.primaryColor),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.size.height * 0.04),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                    side: BorderSide(
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.googleIcn,
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Login With Google",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20,
                        color: ColorPalette.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).setCenter(),
        ),
      ),
    );
  }
}
