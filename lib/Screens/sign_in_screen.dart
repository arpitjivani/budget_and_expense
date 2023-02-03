import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendee_budget_and_expense/Screens/drawer_main_screen.dart';
import 'package:spendee_budget_and_expense/Screens/your_profile_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String userEmail = "";
  bool isSignIn = false;
  late DatabaseReference _reference;
  late DatabaseReference _databaseRef;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
    'https://www.googleapis.com/auth/drive',
    ],
  );
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  bool isLoading = false;

  bool isUserSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reference = FirebaseDatabase.instance.ref().child('EmailId');
    _databaseRef = FirebaseDatabase.instance.ref().child('UserData');
    initApp();
    checkIfUserIsSignedIn();
    checkLogin();
    print("----------$isUserSignedIn");
  }

  checkLogin() {
    setState(() {
      // Fluttertoast.showToast(msg: "msg");
      isUserSignedIn == false
          ? print("login")
          : Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => DrawerMainScreen(),
              ),
              (route) => false);
    });
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: signInScreenBG,
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                "assets/SignInPage/bg.png",
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: Image.asset(
                    "assets/SignInPage/image.png",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        onGoogleSignIn(context);
                        isLoading = false;
                      } catch (e) {
                        Fluttertoast.showToast(msg: "$e");
                      } finally {
                        setState(() {
                          isLoading = true;
                        });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Take Hold of Your ",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: "SpaceFont",
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Expense & Budget",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: "SpaceFont",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              color: const Color(0xffFF931E),
                              height: 4.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                await signInWithFacebook();
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff1977F3),
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/SignInPage/facebook.png",
                                          width: 30.0),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      const Text(
                                        "Sign in with Facebook",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                            fontFamily: "SpaceFont"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () async {
                                String userLoggedIn =
                                    await getStringFromLocalStorage(
                                        KEY_USER_IS_LOGGED_IN);
                                if (userLoggedIn == "true") {
                                  isUserSignedIn == false
                                      ? onGoogleSignIn(context)
                                      : Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DrawerMainScreen(),
                                          ),
                                          (route) => false);
                                } else {
                                  onGoogleSignIn(context);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffEA4335),
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/SignInPage/google.png",
                                          width: 30.0),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      const Text(
                                        "Sign in with Google    ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                            fontFamily: "SpaceFont"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "By using app agree to Terms of Use & Privacy Policy.",
                    style: TextStyle(
                        fontSize: 10.0,
                        fontFamily: "SpaceFont",
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Future<User> _handleSignIn() async {
    User user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser!;
    } else {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user!;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  Future<bool> getUser() async {
    _databaseRef = FirebaseDatabase.instance.ref().child('UserData');
    dynamic result = await _databaseRef
        .child("UserData")
        .orderByChild("test")
        .equalTo("@svbronisquadgmail.com")
        .once();
    //If the name is available
    if (result == null) {
      return true;
    }

    //That name already exists
    else {
      return false;
    }
  }

  saveStorage(User user) async {
    await saveStringToLocalStorage(KEY_USER_EMAIL, user.email.toString());
    // print("Uid-----${user.uid}");
    await saveStringToLocalStorage(KEY_USER_UID, user.uid);
    await saveStringToLocalStorage(KEY_USER_NAME, user.displayName.toString());
    await saveStringToLocalStorage(KEY_USER_PHOTO, user.photoURL.toString());
  }

  void onGoogleSignIn(BuildContext context) async {
    User user = await _handleSignIn();
    await saveStorage(user);

    DatabaseReference query3 =
        FirebaseDatabase.instance.ref().child('UserData');

    bool isExisting = false;
    query3.onValue.listen((event) async {
      if (event.snapshot.value != null) {
        print('---is true----${event.snapshot.value}');
        Map<dynamic, dynamic> values = event.snapshot.value as Map;
        //  int index=values.containsKey(key)
        values.forEach((key, values) {
          print(values["Email"]);
          print('---key---${key}');
          if (key == user.uid) {
            isExisting = true;
          }
        });

        if (!isExisting) {

          var userSignedIn = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => YourProfile(user, _googleSignIn)),
          );

          setState(() {
            isUserSignedIn = userSignedIn == null ? true : false;
          });
        } else {
          // saveIsLoginStorage() async {
            await saveStringToLocalStorage(KEY_USER_IS_LOGGED_IN, "true");
            // setState(() {});
          // }
          var userSignedIn = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrawerMainScreen()),
          );

          setState(() {
            isUserSignedIn = userSignedIn == null ? true : false;
          });
        }
      } else {
        await saveStorage(user);
        var userSignedIn = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => YourProfile(user, _googleSignIn)),
        );

        setState(() {
          isUserSignedIn = userSignedIn == null ? true : false;
        });
      }
    });
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    userEmail = userData['email'];

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

class Resource {
  final Status status;

  Resource({required this.status});
}

enum Status { Success, Error, Cancelled }
