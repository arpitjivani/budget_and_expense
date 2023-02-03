import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/categories_screen.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/label_screen.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/worked_category_screen.dart';
import 'package:spendee_budget_and_expense/Screens/edit_profile_screen.dart';
import 'package:spendee_budget_and_expense/Screens/sign_in_screen.dart';
import 'package:spendee_budget_and_expense/utils/class_builder.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';
import 'package:spendee_budget_and_expense/utils/utils.dart';

class DrawerMainScreen extends StatefulWidget {
  const DrawerMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DrawerMainScreenState createState() => _DrawerMainScreenState();
}

class _DrawerMainScreenState extends State<DrawerMainScreen>
    with TickerProviderStateMixin {
  late KFDrawerController _drawerController;
  final AuthService _auth = AuthService();
  late Query _reference;
  dynamic email = "";
  var loginCheck;
  var geId;

  void getData() async {
    loginCheck = await getStringFromLocalStorage(KEY_USER_EMAIL);
    print("-=-=-=-=${loginCheck.toString()}");
    setState(() {});
  }

  void getUid() async {
    geId = await getStringFromLocalStorage(KEY_USER_UID);
    print("-=-=-=-=${geId.toString()}");
    setState(() {});
  }

  DatabaseReference? db;
  String? getUId;
  var nameFirst;
  var nameLast;

  getUData() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    db = FirebaseDatabase.instance.ref().child("UserData");
    print("*******$getUId");

    db?.child("$getUId").get().asStream().forEach((ele) {
      var childValue = ele.value as Map;
      nameFirst = childValue["firstName"].toString();
      nameLast = childValue["lastName"].toString();
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUData();
    getData();
    getUid();
    _reference = FirebaseDatabase.instance
        .ref()
        .child('UserData')
        .child("IncomeExpenseData")
        .child('Parental Leave');

    getUserInformation();
    // _reference = FirebaseDatabase.instance.ref().child("UserData").orderByChild("User1").orderByPriority().once() as Query;
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('MainPage'),
      items: [
        KFDrawerItem.initWithPage(
          text: const CommonText(
              text: "Categories",
              size: 16.0,
              weight: FontWeight.w500,
              color: Colors.white),
          icon: Image.asset("assets/Drawer/category.png", width: 20.0),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CategoriesScreen(),
            ));
          },
        ),
        KFDrawerItem.initWithPage(
          text: const CommonText(
              text: "Labels",
              size: 16.0,
              weight: FontWeight.w500,
              color: Colors.white),
          icon: Image.asset("assets/Drawer/label.png", width: 20.0),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LabelScreen(),
            ));
          },
        ),
        KFDrawerItem.initWithPage(
          text: const CommonText(
              text: "Manual Wallets",
              size: 16.0,
              weight: FontWeight.w500,
              color: Colors.white),
          icon: Image.asset("assets/Drawer/wallet.png", width: 20.0),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const ManualWallets(),
            // ));
          },
        ),
        KFDrawerItem.initWithPage(
          text: const CommonText(
              text: "Support",
              size: 16.0,
              weight: FontWeight.w500,
              color: Colors.white),
          icon: Image.asset("assets/Drawer/setting.png", width: 20.0),
          onPressed: () {
            Fluttertoast.showToast(msg: "Support");
          },
        ),
        KFDrawerItem.initWithPage(
          text: const CommonText(
              text: "Terms & Policy",
              size: 16.0,
              weight: FontWeight.w500,
              color: Colors.white),
          icon: Image.asset("assets/Drawer/policy.png", width: 20.0),
          onPressed: () {
            Fluttertoast.showToast(msg: "Terms & Policy");
          },
        ),
        KFDrawerItem.initWithPage(
          text: const CommonText(
              text: "Log out",
              size: 16.0,
              weight: FontWeight.w500,
              color: Colors.white),
          icon: Image.asset("assets/Drawer/logout.png", width: 20.0),
          onPressed: () async {
            setState(() {
              saveIsLoginStorage();
              logoutAction(context);
            });
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Test(),));
          },
        ),
      ],
    );
  }

  saveIsLoginStorage() async {
    await saveStringToLocalStorage(KEY_USER_IS_LOGGED_IN, "false");
    setState(() {});
  }

  getUserInformation() {
    email = '';
    _reference.get().asStream().forEach((event) {
      event.children.forEach((element) {
        var childVal = element.value as Map;
        email += num.parse(childVal["mainCategory"].toString());
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("++++++++$email");
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
        controller: _drawerController,
        header: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditProfileScreen(
                data: loginCheck.toString(),
                profileData: nameFirst,
                profileData2: nameLast,
              ),
            ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0, bottom: 20.0),
                child: SizedBox(
                  child: SizedBox(
                    height: 45.0,
                    width: 45.0,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/SignInPage/user.png"),
                              //Selected Image
                              fit: BoxFit.contain),
                        ),
                      ), //Replace with Image From DB
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                      text: loginCheck.toString(),
                      size: 16.0,
                      weight: FontWeight.w500,
                      color: Colors.white),
                  CommonText(
                      text: loginCheck.toString(),
                      size: 12.0,
                      weight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5)),
                ],
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              mainBG1,
              mainBG2,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
