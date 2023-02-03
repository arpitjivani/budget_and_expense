import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/drawer_main_screen.dart';
import 'package:spendee_budget_and_expense/Screens/sign_in_screen.dart';
import 'package:spendee_budget_and_expense/Screens/splash.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkUserLogin() async {
    String userLoggedIn =
        await getStringFromLocalStorage(KEY_USER_IS_LOGGED_IN);
    if (userLoggedIn == "true") {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DrawerMainScreen(),
            ));
      });
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Splash(),
              )));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  mainBG1,
                  mainBG2,
                ],
              )),
              child: Stack(
                children: [
                  Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Image.asset("assets/logo_with_bg.png"),
                      ),
                      const CommonText(
                          text: "Expense & Budget",
                          size: 30.0,
                          weight: FontWeight.w700,
                          color: Colors.white)
                    ],
                  )),
                  Image.asset("assets/splash_bg.png"),
                ],
              )),
        ),
      ),
    );
  }
}
