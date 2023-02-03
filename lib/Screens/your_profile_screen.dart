import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_circular_indicator.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_textfield.dart';
import 'package:spendee_budget_and_expense/Screens/drawer_main_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

// class YourProfile extends StatelessWidget {
//   late GoogleSignIn _googleSignIn;
//   late User _user;
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//
//   YourProfile(User user, GoogleSignIn signIn) {
//     _user = user;
//     _googleSignIn = signIn;
//   }
//
//   late DatabaseReference _reference;
//
//
//   @override
//   Widget build(BuildContext context) {
//     File _image;
//
//     return CommonScaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Column(children: [
//                 const SizedBox(height: 30.0),
//                 const CommonText(
//                     text: "Your Profile",
//                     size: 18.0,
//                     weight: FontWeight.w700,
//                     color: Colors.white),
//                 const SizedBox(height: 40.0),
//                 Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     SizedBox(
//                       height: 110.0,
//                       width: 110.0,
//                       child: CircleAvatar(
//                           radius: 30.0,
//                           backgroundColor: Colors.white,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               image: DecorationImage(
//                                   image:
//                                       NetworkImage(_user.photoURL.toString()),
//                                   //Selected Image
//                                   fit: BoxFit.cover),
//                             ),
//                           ) //Replace with Image From DB
//                           ),
//                     ),
//                     Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: InkWell(
//                           onTap: () {
//                             Fluttertoast.showToast(msg: "Remove Image");
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.5),
//                                     blurRadius: 5.0,
//                                   ),
//                                 ],
//                                 gradient: const LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     mainBG1,
//                                     mainBG2,
//                                   ],
//                                 )),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.asset("assets/SignInPage/delete.png",
//                                   width: 20.0),
//                             ),
//                           ),
//                         )),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 40.0,
//                 ),
//                 CommonTextField(
//                   keyboardType: TextInputType.name,
//                   controller: firstNameController,
//                   text: "Enter First name",
//                 ),
//                 const SizedBox(
//                   height: 25.0,
//                 ),
//                 CommonTextField(
//                   keyboardType: TextInputType.name,
//                   controller: lastNameController,
//                   text: "Enter Last name",
//                 ),
//                 const SizedBox(
//                   height: 25.0,
//                 ),
//                 CommonText(
//                     text: _user.email.toString(),
//                     size: 20.0,
//                     weight: FontWeight.w500,
//                     color: Colors.white),
//                 CommonText(
//                     text: _user.displayName.toString(),
//                     size: 20.0,
//                     weight: FontWeight.w500,
//                     color: Colors.white),
//               ]),
//             ),
//             CommonButton(
//                 text: "Continue",
//                 onTap: () {
//                   // Navigator.of(context).push(MaterialPageRoute(
//                   //   builder: (context) => const DrawerMainScreen(),
//                   // ));
//                   if (firstNameController.text.isEmpty) {
//                     Fluttertoast.showToast(msg: "Please Enter First Name");
//                   } else if (lastNameController.text.isEmpty) {
//                     Fluttertoast.showToast(msg: "Please Enter Last Name");
//                   } else {
//                     saveUserData();
//                   }
//                   print(firstNameController.text);
//                   print(lastNameController.text);
//                   print(_user.email.toString()    );
//                   // Navigator.pushAndRemoveUntil(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //       builder: (context) => DrawerMainScreen(),
//                   //     ),
//                   //     (route) => false);
//                 }),
//             const SizedBox(
//               height: 40.0,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void saveUserData() {
//    String firstName = firstNameController.text;
//    String lastName = lastNameController.text;
//    String emailId = _user.email.toString();
//
//     Map<String, String> contact = {
//       'emailId': emailId,
//       'firstName': firstName,
//       'lastName': lastName,
//     };
//
//     _reference.push().set(contact).then((value) {
//       // Navigator.of(context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//       //     DrawerMainScreen()), (Route<dynamic> route) => false);
//     });
//   }
// }

class YourProfile extends StatefulWidget {
  late GoogleSignIn _googleSignIn;
  late User _user;

  YourProfile(User user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  late DatabaseReference _databaseRef;
  bool isLoading = false;

  saveIsLoginStorage() async {
    await saveStringToLocalStorage(KEY_USER_IS_LOGGED_IN, "true");
    setState(() {});
  }

  Your(User user, GoogleSignIn signIn) {
    widget._user = user;
    widget._googleSignIn = signIn;
  }

  late DatabaseReference _reference;
  bool isCheck = false;

  var isLogin;

  test() async {
    isLogin = await getStringFromLocalStorage(KEY_USER_IS_LOGGED_IN);
    setState(() {});
  }

  @override
  void initState() {
    test();
    // TODO: implement initState
    super.initState();
    _reference = FirebaseDatabase.instance.ref().child('UserData');
    _databaseRef = FirebaseDatabase.instance.ref().child('UserData');
    firstNameController = TextEditingController(
        text: widget._user.displayName!.split(" ").first.toString());
    lastNameController = TextEditingController(
        text: "${widget._user.displayName!.split(" ").last.toString()}");
    getUser();
    // updateStarCount(context);
  }

  Future<bool> getUser() async {
    dynamic result = await _databaseRef
        .orderByKey()
        .equalTo("svbronisquad@gmail.com")
        .once();
    //If the name is available
    if (result == true) {
      print("-------->> User Already Available");
      return true;
    }

    //That name already exists
    else {
      print("-------->> User Not Available");
      return false;
    }
  }

  File? _image;

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(children: [
                const SizedBox(height: 30.0),
                const CommonText(
                    text: "Your Profile",
                    size: 18.0,
                    weight: FontWeight.w700,
                    color: Colors.white),
                const SizedBox(height: 40.0),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 110.0,
                      width: 110.0,
                      child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                  insetPadding: const EdgeInsets.all(25.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  elevation: 0.0,
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff2C3036),
                                            Color(0xff1C1F22)
                                          ],
                                        ),
                                        border: Border.all(
                                            color: const Color(0xff000000)
                                                .withOpacity(0.05),
                                            width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                              color: const Color(0xff1F2427)
                                                  .withOpacity(0.4),
                                              // color: Colors.red.withOpacity(0.8),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              offset: const Offset(4, 4)),
                                          BoxShadow(
                                              color: const Color(0xff484E53)
                                                  .withOpacity(0.2),
                                              // color: Colors.yellow.withOpacity(0.6),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              offset: const Offset(-2, -4)),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    height: Get.height / 3.9,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  CommonText(
                                                      text: "Select Photo",
                                                      size: 18.0,
                                                      weight: FontWeight.w500,
                                                      color: Colors.white),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      getImageFromCamera();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const CommonText(
                                                            text: "Take Photo",
                                                            size: 18.0,
                                                            weight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                        const SizedBox(
                                                          width: 15.0,
                                                        ),
                                                        Image.asset(
                                                          "assets/Drawer/right_arrow.png",
                                                          width: 30.0,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 30.0,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      getImageFromGallery();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const CommonText(
                                                            text:
                                                                "Choose From Library",
                                                            size: 18.0,
                                                            weight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                        const SizedBox(
                                                          width: 15.0,
                                                        ),
                                                        Image.asset(
                                                          "assets/Drawer/right_arrow.png",
                                                          width: 30.0,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              const Alignment(1.10, -1.10),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Color(0xff2C3036),
                                                      Color(0xff1C1F22)
                                                    ],
                                                  ),
                                                  border: Border.all(
                                                      color: const Color(
                                                              0xff000000)
                                                          .withOpacity(0.05),
                                                      width: 2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xff1F2427)
                                                            .withOpacity(0.8),
                                                        blurRadius: 10,
                                                        spreadRadius: 0,
                                                        offset:
                                                            const Offset(4, 4)),
                                                    BoxShadow(
                                                        color: const Color(
                                                                0xff484E53)
                                                            .withOpacity(0.6),
                                                        blurRadius: 10,
                                                        spreadRadius: 0,
                                                        offset: const Offset(
                                                            -2, -4)),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: _image == null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                            widget._user.photoURL.toString()),
                                        fit: BoxFit.cover)
                                    : DecorationImage(
                                        image: FileImage(_image!),
                                        fit: BoxFit.cover),
                              ),
                            ),
                          ) //Replace with Image From DB
                          ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Fluttertoast.showToast(msg: "Remove Image");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 5.0,
                                  ),
                                ],
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    mainBG1,
                                    mainBG2,
                                  ],
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/SignInPage/delete.png",
                                  width: 20.0),
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                CommonTextField(
                  keyboardType: TextInputType.name,
                  controller: firstNameController,
                  text: "Enter First name",
                ),
                const SizedBox(
                  height: 25.0,
                ),
                CommonTextField(
                  keyboardType: TextInputType.name,
                  controller: lastNameController,
                  text: "Enter Last name",
                ),
                const SizedBox(
                  height: 25.0,
                ),
              ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              child: InkWell(
                onTap: () {
                  if (firstNameController!.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Please Enter First Name");
                  } else if (lastNameController!.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Please Enter Last Name");
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      saveIsLoginStorage();
                      saveUserData();
                      isLoading = false;
                    } catch (e) {
                      Fluttertoast.showToast(msg: "$e");
                    } finally {
                      setState(() {
                        isLoading = true;
                      });
                    }
                  }
                  print(firstNameController!.text);
                  print(lastNameController!.text);
                  print(widget._user.email.toString());
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.5),
                          // color: Colors.red.withOpacity(0.8),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, 0)),
                    ],
                    border:
                        Border.all(width: 2.0, color: const Color(0xff11A8FD)),
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      child: isLoading
                          ? CommonCircularIndicator()
                          : CommonText(
                              text: "Continue",
                              size: 16.0,
                              weight: FontWeight.w700,
                              color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }

  saveDataToStorage() async {
    await saveStringToLocalStorage(
        KEY_USER_EMAIL, widget._user.email.toString());
    await saveStringToLocalStorage(KEY_USER_UID, widget._user.uid);
  }

  void saveUserData() {
    String firstName = firstNameController!.text;
    String lastName = lastNameController!.text;
    String emailId = widget._user.email.toString();

    Map<String, String> contact = {
      'emailId': emailId,
      'firstName': firstName,
      'lastName': lastName,
      'image': _image == null ? "" : base64Encode(_image!.readAsBytesSync()),
    };

    _reference.child(widget._user.uid).set(contact).then((value) {
      saveDataToStorage();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => DrawerMainScreen(),
          ),
          (Route<dynamic> route) => false);
    });
  }
}