import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:spendee_budget_and_expense/Screens/activity_screen.dart';
import 'package:spendee_budget_and_expense/Screens/add_new_budget_screen.dart';
import 'package:spendee_budget_and_expense/Screens/budget_screen.dart';
import 'package:spendee_budget_and_expense/Screens/edit_cash_wallet_screen.dart';
import 'package:spendee_budget_and_expense/Screens/edit_categories.dart';
import 'package:spendee_budget_and_expense/Screens/home_screen.dart';
import 'package:spendee_budget_and_expense/Screens/monthly_expense_details_screen.dart';
import 'package:spendee_budget_and_expense/Screens/screen_2.dart';
import 'package:spendee_budget_and_expense/Screens/wallet_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

// ignore: must_be_immutable
class MainPage extends KFDrawerContent {
  MainPage({Key? key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    void _updateIndex(int value) {
      setState(() {
        _selectedIndex = value;
      });
    }

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();

        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: mainBG1,
          child: SafeArea(
            child: Stack(
              children: [
                _buildOffstageNavigator(0),
                _buildOffstageNavigator(1),
                _buildOffstageNavigator(2),
                _buildOffstageNavigator(3),
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff353A40), Color(0xff16171B)],
            ),
            borderRadius: BorderRadius.only(
              // topRight: Radius.circular(28.0),
              // topLeft: Radius.circular(28.0),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _updateIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xff7F8489),
            selectedFontSize: 13,
            unselectedFontSize: 13,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                label: "Timeline",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0,top: 3.0),
                  child: Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2.0,
                            color: _selectedIndex == 0
                                ? const Color(0xff11A8FD)
                                : Colors.black.withOpacity(0.3)),
                        gradient: _selectedIndex == 0
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                              )
                            : const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff353A40), Color(0xff16171B)],
                              ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/HomePage/timeline.png",
                            color: _selectedIndex == 0
                                ? Colors.white
                                : const Color(0xff7F8489)),
                      )),
                ),
              ),
              BottomNavigationBarItem(
                label: "Wallet",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0,top: 3.0),
                  child: Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2.0,
                            color: _selectedIndex == 1
                                ? const Color(0xff11A8FD)
                                : Colors.black.withOpacity(0.3)),
                        gradient: _selectedIndex == 1
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                              )
                            : const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff353A40), Color(0xff16171B)],
                              ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/HomePage/wallet.png",
                            color: _selectedIndex == 1
                                ? Colors.white
                                : const Color(0xff7F8489)),
                      )),
                ),
              ),
              BottomNavigationBarItem(
                label: "Budget",
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0,top: 3.0),
                  child: Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2.0,
                            color: _selectedIndex == 2
                                ? const Color(0xff11A8FD)
                                : Colors.black.withOpacity(0.3)),
                        gradient: _selectedIndex == 2
                            ? const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                              )
                            : const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff353A40), Color(0xff16171B)],
                              ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/HomePage/budget.png",
                            color: _selectedIndex == 2
                                ? Colors.white
                                : const Color(0xff7F8489)),
                      )),
                ),
              ),
              // BottomNavigationBarItem(
              //   label: "Activity",
              //   icon: Padding(
              //     padding: const EdgeInsets.only(bottom: 3.0,top: 3.0),
              //     child: Container(
              //         width: 45.0,
              //         height: 45.0,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(
              //               width: 2.0,
              //               color: _selectedIndex == 3
              //                   ? const Color(0xff11A8FD)
              //                   : Colors.black.withOpacity(0.3)),
              //           gradient: _selectedIndex == 3
              //               ? const LinearGradient(
              //                   begin: Alignment.topCenter,
              //                   end: Alignment.bottomCenter,
              //                   colors: [
              //                     Color(0xff0160A5),
              //                     Color(0xff11A7FC)
              //                   ],
              //                 )
              //               : const LinearGradient(
              //                   begin: Alignment.topCenter,
              //                   end: Alignment.bottomCenter,
              //                   colors: [
              //                     Color(0xff353A40),
              //                     Color(0xff16171B)
              //                   ],
              //                 ),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Image.asset("assets/HomePage/activity.png",
              //               color: _selectedIndex == 3
              //                   ? Colors.white
              //                   : const Color(0xff7F8489)),
              //         )),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _next() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Screen2()));
  }

  void _nextEditWallet() {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const EditCashWalletScreen()));
  }

  void _editCashWallet() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const EditCategories(categoryKey: '', uid: null,)));
  }

  void _addNewBudget() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddNewBudgetScreen()));
  }

  void _budget() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MonthlyExpenseDetailsScreen()));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomeScreen(dataDrawer: widget.onMenuPressed!, data: _editCashWallet),
          WalletScreen(
              dataDrawer: widget.onMenuPressed!,
              onNext: _nextEditWallet,
              onNext3: _editCashWallet),
          BudgetScreen(
              dataDrawer: widget.onMenuPressed!,
              onNext: _addNewBudget,
              onNext2: _budget),
          ActivityScreen(onNext: _next),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name!]!(context),
          );
        },
      ),
    );
  }
}
