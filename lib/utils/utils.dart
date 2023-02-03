import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spendee_budget_and_expense/Screens/sign_in_screen.dart';
import 'package:spendee_budget_and_expense/Screens/splash_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';


Future<void> logoutAction(BuildContext context) async {
  // accessMobNo = "";
  
  await const FlutterSecureStorage().deleteAll();
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context) {
      return const SplashScreen();
    },
  ), (route) => false);
}




