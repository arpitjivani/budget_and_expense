// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class WelcomeUserWidget extends StatefulWidget {
//   late GoogleSignIn _googleSignIn;
//   late User _user;
//
//   WelcomeUserWidget(User user, GoogleSignIn signIn) {
//     _user = user;
//     _googleSignIn = signIn;
//   }
//
//   @override
//   State<WelcomeUserWidget> createState() => _WelcomeUserWidgetState();
// }
//
// class _WelcomeUserWidgetState extends State<WelcomeUserWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(color: Colors.black),
//           elevation: 0,
//         ),
//         body: Container(
//             color: Colors.white,
//             padding: EdgeInsets.all(50),
//             child: Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     ClipOval(
//                         child: Image.network(_user.photoURL.toString(),
//                             width: 100, height: 100, fit: BoxFit.cover)),
//                     SizedBox(height: 20),
//                     Text('Welcome,', textAlign: TextAlign.center),
//                     Text(_user.displayName.toString(),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 25)),
//                     SizedBox(height: 20),
//                     FlatButton(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         onPressed: () {
//                           _googleSignIn.signOut();
//                           Navigator.pop(context, false);
//                         },
//                         color: Colors.redAccent,
//                         child: Padding(
//                             padding: EdgeInsets.all(10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 Icon(Icons.exit_to_app, color: Colors.white),
//                                 SizedBox(width: 10),
//                                 Text('Log out of Google',
//                                     style: TextStyle(color: Colors.white))
//                               ],
//                             )))
//                   ],
//                 ))));
//   }
// }
