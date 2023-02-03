import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_textfield.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class EditProfileScreen extends StatefulWidget {
  final String data;
  final dynamic profileData;
  final dynamic profileData2;

  const EditProfileScreen(
      {Key? key,
      required this.data,
      required this.profileData,
      this.profileData2})
      : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  late DatabaseReference _ref;

  String? getUId;

  getId() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
  }

  @override
  void initState() {
    // getUData();
    _ref = FirebaseDatabase.instance.ref().child('UserData');
    getId();
    super.initState();
    firstNameController = TextEditingController(text: widget.profileData);
    lastNameController = TextEditingController(text: widget.profileData2);
    emailController = TextEditingController(text: widget.data.toString());
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
                CommonText(
                    text: "Your Profile",
                    size: 18.0,
                    weight: FontWeight.w700,
                    color: Colors.white),
                const SizedBox(height: 40.0),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            insetPadding: const EdgeInsets.all(25.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
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
                                  borderRadius: BorderRadius.circular(20.0)),
                              height: Get.height / 3.9,
                              padding: const EdgeInsets.all(0.0),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                getImageFromCamera();
                                                Navigator.of(context).pop();
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const CommonText(
                                                      text: "Take Photo",
                                                      size: 18.0,
                                                      weight: FontWeight.w500,
                                                      color: Colors.white),
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
                                                Navigator.of(context).pop();
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const CommonText(
                                                      text:
                                                          "Choose From Library",
                                                      size: 18.0,
                                                      weight: FontWeight.w500,
                                                      color: Colors.white),
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
                                    alignment: const Alignment(1.10, -1.10),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
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
                                                      .withOpacity(0.8),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: const Offset(4, 4)),
                                              BoxShadow(
                                                  color: const Color(0xff484E53)
                                                      .withOpacity(0.6),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: const Offset(-2, -4)),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.close,
                                            color:
                                                Colors.white.withOpacity(0.5),
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
                      child: SizedBox(
                        height: 110.0,
                        width: 110.0,
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: _image == null
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            "assets/SignInPage/user.png"),
                                        fit: BoxFit.cover)
                                    : DecorationImage(
                                        image: FileImage(_image!),
                                        fit: BoxFit.cover),
                              ),
                            )),
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
                CommonTextField(
                  keyboardType: TextInputType.name,
                  controller: emailController,
                  text: "Email Address",
                ),
              ]),
            ),
            CommonButton(
                text: "Update",
                onTap: () {
                  editProfile();
                }),
            const SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }

  void editProfile() {
    String editFirstName = firstNameController!.text;
    String editLastName = lastNameController!.text;

    Map<String, dynamic> contact = {
      'firstName': editFirstName,
      'lastName': editLastName,
    };

    _ref.child("$getUId").update(contact).then((value) {
      Navigator.pop(context, true);
      setState(() {});
    });
  }

// void editProfile() {
//   String amount = _currentValue.toString();
//
//   Map<String, String> contact = {
//     'amount': amount,
//   };
//
//   _ref
//       .child("IncomeExpenseData")
//       .child(widget.categoryKey)
//       .update(contact)
//       .then((value) {
//     Navigator.pop(context, true);
//   });
// }
}
