import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/snack_bar_service.dart';

class FirebaseFunctions {
  static Future<bool> signUpWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    EasyLoading.show();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      SnackBarService.showSuccessMessage("Account Created successfully!");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
            e.message ?? ":The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
            e.message ?? "The account already exists for that email.");
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  static Future<bool> signInWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    print(emailAddress);
    print(password);

    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print(credential.user!.email);
      print(credential.user!.uid);

      SnackBarService.showSuccessMessage("Account Created successfully!");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      print("${e.message} ------> Signing in failed");
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
            e.message ?? ":The password provided is too weak.");
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage(
            e.message ?? "The account already exists for that email.");
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}
