import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendee_budget_and_expense/Screens/ADD_Category_Dialog.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class HomeScreenController extends GetxController{

  Query? reference;
  Query? searchRef;
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  num totalAmount = 0;
  num chartExpenseAmount = 0;
  num chartIncomeAmount = 0;

  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    // print("KEY_USER_UID:$getUId");
    reference = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("Wallet")
        .child("IncomeExpenseData");
    calculateTotal();
    chartExpenseTotal();
    chartIncomeTotal();
    update();
  }


  calculateTotal() {
    totalAmount = 0;
    reference!.get().asStream().forEach((event) {
      event.children.forEach((element) {
        var childVal = element.value as Map;

        // print((element.value as Map));
        if ((element.value as Map)["categoryName"] == "Expense") {
          totalAmount -= num.parse(childVal["amount"].toString());
        } else {
          totalAmount += num.parse(childVal["amount"].toString());
        }
      });
      update();
    });
    // print("AAAAAAA ===>>> $reference");
    // setState(() {});
  }


  chartExpenseTotal() {
    chartExpenseAmount = 0;
    reference!.get().asStream().forEach((event) {
      event.children.forEach((element) {
        var childVal = element.value as Map;

        // print((element.value as Map));
        if ((element.value as Map)["categoryName"] == "Expense") {
          chartExpenseAmount += num.parse(childVal["amount"].toString());
        } else {
          // chartExpenseAmount += num.parse(childVal["amount"].toString());
        }
      });
    });
    update();
// setState(() {});
  }

  chartIncomeTotal() {
    chartIncomeAmount = 0;
    reference!.get().asStream().forEach((event) {
      event.children.forEach((element) {
        var childVal = element.value as Map;

        // print((element.value as Map));
        if ((element.value as Map)["categoryName"] == "Income") {
          chartIncomeAmount += num.parse(childVal["amount"].toString());
        } else {
          // chartIncomeAmount += num.parse(childVal["amount"].toString());
        }
      });
    });
    update();
    // setState(() {});
  }


  @override
  void onInit() {
    // TODO: implement onInit

    getEmailToStorage();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
    super.onInit();
  }

  updateAllData(){
    calculateTotal();
    chartExpenseTotal();
    chartIncomeTotal();
  }
}