import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_dialog.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_textfield.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/categories_screen.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/worked_category_screen.dart';
import 'package:spendee_budget_and_expense/Screens/color_picker.dart';
import 'package:spendee_budget_and_expense/Screens/icon_picker.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class EditIncomeCategoriesDrawerScreen extends StatefulWidget {
  final PaintIncome data2;
  final String firebaseKey;

  const EditIncomeCategoriesDrawerScreen(
      {Key? key, required this.data2, required this.firebaseKey})
      : super(key: key);

  @override
  _EditIncomeCategoriesDrawerScreenState createState() =>
      _EditIncomeCategoriesDrawerScreenState();
}

class _EditIncomeCategoriesDrawerScreenState
    extends State<EditIncomeCategoriesDrawerScreen> {
  late final TextEditingController _category =
      TextEditingController(text: widget.data2.title);

  String? getUId;

  getId() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
  }

  DatabaseReference? _ref;


  @override
  void initState() {
    getId();
    _ref = FirebaseDatabase.instance.ref().child('UserData');
    // TODO: implement initState
    super.initState();
    // _color = widget.data2.colorPicture1!;
    // _color2 = widget.data2.colorPicture2!;
    _icon = widget.data2.icon!;
  }

  late Color _color;
  late Color _color2;
  late String _icon;

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
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40.0,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: AlignmentDirectional.topCenter,
                              fit: StackFit.loose,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xff2F353A),
                                          Color(0xff1C1F22)
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xff1F2427)
                                                .withOpacity(0.4),
                                            // color: Colors.red.withOpacity(0.8),
                                            blurRadius: 5,
                                            spreadRadius: 0,
                                            offset: const Offset(4, 4)),
                                        BoxShadow(
                                            color: const Color(0xff484E53)
                                                .withOpacity(0.3),
                                            // color: Colors.yellow.withOpacity(0.6),
                                            blurRadius: 5,
                                            spreadRadius: 0,
                                            offset: const Offset(-2, -4)),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 50.0,
                                          bottom: 20.0,
                                          left: 10.0,
                                          right: 10.0),
                                      child: CommonTextField(
                                          text: "Category Name",
                                          controller: _category,
                                          keyboardType: TextInputType.text)),
                                ),
                                Positioned(
                                    top: -35,
                                    child: Container(
                                      width: 65.0,
                                      height: 65.0,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.red,
                                              Colors.yellow,
                                            ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xff1F2427)
                                                    .withOpacity(0.8),
                                                // color: Colors.red.withOpacity(0.8),
                                                blurRadius: 10,
                                                spreadRadius: 0,
                                                offset: const Offset(4, 4)),
                                            BoxShadow(
                                                color: const Color(0xff484E53)
                                                    .withOpacity(0.6),
                                                // color: Colors.yellow.withOpacity(0.6),
                                                blurRadius: 10,
                                                spreadRadius: 0,
                                                offset: const Offset(-2, -4)),
                                          ],
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image.asset(_icon,
                                            color: Colors.white),
                                      ),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                CommonText(
                                    text: "Category Color",
                                    size: 16.0,
                                    weight: FontWeight.w500,
                                    color: Colors.white)
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Image.asset("assets/left_arrow.png",
                                    width: 20.0, color: Colors.white),
                                Expanded(
                                  child: MyColorPicker(
                                    onSelectColor: (value) {
                                      setState(() {
                                        _color = value;
                                      });
                                    },
                                    onSelectColor2: (value) {
                                      setState(() {
                                        _color2 = value;
                                      });
                                    },
                                    availableColors: const [
                                      Color(0xff016BB8),
                                      Color(0xffD3200C),
                                      Color(0xff4C00E1),
                                      Color(0xffC21FEE),
                                      Color(0xff1F9C53),
                                      Color(0xff89216B),
                                      Color(0xffF06500),
                                      Color(0xff3F2B96),
                                      Color(0xff1144FF),
                                      Color(0xff021B79),
                                    ],
                                    availableColors2: const [
                                      Color(0xff11A8FD),
                                      Color(0xffFF5510),
                                      Color(0xff8A2BE2),
                                      Color(0xffF35EA0),
                                      Color(0xff3EF190),
                                      Color(0xffDA4453),
                                      Color(0xffFFA05C),
                                      Color(0xffA8C0FF),
                                      Color(0xffFF2CDF),
                                      Color(0xff0575E6),
                                    ],
                                    initialColor: Colors.blue,
                                  ),
                                ),
                                Image.asset("assets/_right_arrow.png",
                                    width: 20.0, color: Colors.white),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                CommonText(
                                    text: "Category Icon",
                                    size: 16.0,
                                    weight: FontWeight.w500,
                                    color: Colors.white),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            MyIconPicker(
                              onSelectIcon: (value) {
                                setState(() {
                                  _icon = value;
                                });
                              },
                              initialColor: Colors.blue,
                              initialIcon: "",
                              availableIcons: const [
                                "assets/Category_Icon/apple.png",
                                "assets/Category_Icon/balloon.png",
                                "assets/Category_Icon/beauty.png",
                                "assets/Category_Icon/bed.png",
                                "assets/Category_Icon/bike.png",
                                "assets/Category_Icon/bill.png",
                                "assets/Category_Icon/book.png",
                                "assets/Category_Icon/car.png",
                                "assets/Category_Icon/card.png",
                                "assets/Category_Icon/cloth.png",
                                "assets/Category_Icon/diamond.png",
                                "assets/Category_Icon/drawing.png",
                                "assets/Category_Icon/dumbbell.png",
                                "assets/Category_Icon/education.png",
                                "assets/Category_Icon/extra_work.png",
                                "assets/Category_Icon/food.png",
                                "assets/Category_Icon/fuel.png",
                                "assets/Category_Icon/gift.png",
                                "assets/Category_Icon/glass.png",
                                "assets/Category_Icon/groceries.png",
                                "assets/Category_Icon/healthcare.png",
                                "assets/Category_Icon/home.png",
                                "assets/Category_Icon/loan.png",
                                "assets/Category_Icon/lock.png",
                                "assets/Category_Icon/machine.png",
                                "assets/Category_Icon/mechanic.png",
                                "assets/Category_Icon/mobile.png",
                                "assets/Category_Icon/music.png",
                                "assets/Category_Icon/salary.png",
                                "assets/Category_Icon/shopping.png",
                                "assets/Category_Icon/streamline1.png",
                                "assets/Category_Icon/streamline2.png",
                                "assets/Category_Icon/streamline3.png",
                                "assets/Category_Icon/streamline4.png",
                                "assets/Category_Icon/tea.png",
                                "assets/Category_Icon/toy.png",
                                "assets/Category_Icon/train.png",
                                "assets/Category_Icon/transfer.png",
                                "assets/Category_Icon/transport.png",
                                "assets/Category_Icon/travel.png",
                                "assets/Category_Icon/wallet.png",
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 2.0,
                                          color:
                                              Colors.black.withOpacity(0.05)),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff353A40),
                                          Color(0xff16171B)
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                          "assets/left_arrow.png",
                                          color: const Color(0xff7F8489)),
                                    )),
                              ),
                              const CommonText(
                                  text: "Edit Category",
                                  size: 18.0,
                                  weight: FontWeight.w500,
                                  color: Colors.white),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CommonDialog(
                                            title: "Delete Wallet",
                                            subTitle:
                                                "Do you want to delete Category Wallet?",
                                            cancelButtonText: "Cancel",
                                            okButtonText: "Delete",
                                            okClick: () {
                                              var r = FirebaseDatabase.instance
                                                  .ref()
                                                  .child(
                                                      "AddNewCategoryIncome");
                                              r
                                                  .child(widget.firebaseKey)
                                                  .remove()
                                                  .whenComplete(() {
                                                Navigator.pop(context, true);
                                                Navigator.pop(context, true);
                                                setState(() {});
                                              });
                                            },
                                            cancelClick: () {
                                              Navigator.of(context).pop();
                                            }),
                                  );
                                },
                                child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 2.0,
                                          color:
                                              Colors.black.withOpacity(0.05)),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff353A40),
                                          Color(0xff16171B)
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset("assets/delete.png",
                                          color: const Color(0xff7F8489)),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: CommonButton(
                              text: "Edit a Category",
                              onTap: () {
                                editIncome();
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void editIncome() {
    String title = _category.text.toString();
    String image = _icon;

    Map<String, String> contact = {
      "mainCategoryName": title,
      'image': image,
    };

    _ref
        ?.child("$getUId")
        .child("AddNewCategoryIncome")
        .child("${widget.firebaseKey}")
        .update(contact)
        .then((value) {
      Navigator.pop(context, true);
      setState(() {});
    });



  }
}
