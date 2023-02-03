import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';


const signInScreenBG = Color(0XFF191A22);
const mainBG1 = Color(0xff353A40);
const mainBG2 = Color(0xff000000);
const blueColor = Color(0xff058DD9);
const redColor = Color(0xffFE684D);
const greenColor = Color(0xff1DBF02);

const String categoryDefaultColorKey = '016BB8';
const KEY_USER_EMAIL = "isLoggedIn";
const KEY_USER_UID = "isLoggedInWithUID";
const KEY_USER_NAME = "userName";
const KEY_USER_PHOTO = "userPhoto";
const KEY_USER_IS_LOGGED_IN = "isUserLogin";



var getUIdFromStorage;

void getEmailToStorage() async {
  getUIdFromStorage = await getStringFromLocalStorage(KEY_USER_UID);
}