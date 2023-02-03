import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spendee_budget_and_expense/Screens/drawer_main_screen.dart';
import 'package:spendee_budget_and_expense/Screens/sign_in_screen.dart';
import 'package:spendee_budget_and_expense/intro_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {



  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const IntroScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBG1,
      body: Container(),
    );
  }
}

//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:spendee_budget_and_expense/graph_screen.dart';
//
// class Splash extends StatefulWidget {
//   @override
//   VideoState createState() => VideoState();
// }
//
// class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
//   var _visible = true;
//
//   late AnimationController animationController;
//   late Animation<double> animation;
//
//   startTime() async {
//     var _duration =  Duration(seconds: 2);
//     return new Timer(_duration, navigationPage);
//   }
//
//   void navigationPage() {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => GraphScreen()));
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     animationController =  AnimationController(
//         vsync: this, duration:  Duration(seconds: 1));
//     animation =
//          CurvedAnimation(parent: animationController, curve: Curves.easeOut);
//
//     animation.addListener(() => this.setState(() {}));
//     animationController.forward();
//
//     setState(() {
//       _visible = !_visible;
//     });
//     startTime();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//            Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Padding(
//                   padding: EdgeInsets.only(bottom: 30.0),
//                   child:  Image.asset(
//                     'assets/powered_by.png',
//                     height: 25.0,
//                     fit: BoxFit.scaleDown,
//                   ))
//             ],
//           ),
//            Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//                Image.asset(
//                 'assets/devs.jpg',
//                 width: animation.value * 250,
//                 height: animation.value * 250,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
