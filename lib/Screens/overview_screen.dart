import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_container.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Demo/Pie_Chart/samples/indicator.dart';
import 'package:spendee_budget_and_expense/Screens/one_candle_chart.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class OverviewScreen extends StatefulWidget {
  final dynamic data;
  final dynamic data2;

  const OverviewScreen({
    Key? key,
    this.data,
    this.data2,
  }) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen>
    with TickerProviderStateMixin {
  late Query _reference;

  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    _reference = FirebaseDatabase.instance
        .ref()
        .child('UserData')
        .child("$getUId")
        .child("Wallet")
        .child('IncomeExpenseData');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEmailToStorage();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int touchedIndex = -1;

  late TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
                        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 65,
                              // width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xff000000)
                                          .withOpacity(0.5),
                                      // color: Colors.red.withOpacity(0.8),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 0)),
                                ],
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff2F353A),
                                    Color(0xff2F353A)
                                  ],
                                ),
                              ),
                              child: TabBar(
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff0160A5),
                                      Color(0xff11A7FC)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    25.0,
                                  ),
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.white,
                                tabs: [
                                  Tab(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CommonText(
                                              text:
                                                  "₹${'-' + widget.data.toString()}",
                                              size: 20.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white),
                                          SizedBox(
                                            height: 3.0,
                                          ),
                                          CommonText(
                                              text: "Total Expense",
                                              size: 12.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CommonText(
                                              text:
                                                  "₹${widget.data2.toString()}",
                                              overflow: TextOverflow.ellipsis,
                                              size: 20.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white),
                                          SizedBox(
                                            height: 3.0,
                                          ),
                                          CommonText(
                                              overflow: TextOverflow.ellipsis,
                                              text: "Total Income",
                                              size: 12.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        expenseTab(),
                                        incomeTab(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100.0,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, true);
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
                                      color: Colors.black.withOpacity(0.05)),
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
                                  child: Image.asset("assets/left_arrow.png",
                                      color: const Color(0xff7F8489)),
                                )),
                          ),
                          const CommonText(
                              text: "Overview",
                              size: 18.0,
                              weight: FontWeight.w500,
                              color: Colors.white),
                          Container(
                            width: 45.0,
                            height: 45.0,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget expenseTab() {
    return Column(
      children: [
        CommonContainer(
          height: 170.0,
          padding: const EdgeInsets.all(5.0),
          child: ExpenseOneCandleBarChart(expenseData: widget.data),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const CommonText(
            text: "Categories",
            size: 20.0,
            weight: FontWeight.w500,
            color: Colors.white),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.4,
          child: pieChart(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: FirebaseAnimatedList(
              reverse: false,
              defaultChild: const Center(child: CircularProgressIndicator()),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              query: _reference,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map contact = snapshot.value as Map;
                contact['key'] = snapshot.key;
                return _addExpenseCategoryItem(category: contact);
              }),
        ),
      ],
    );
  }

  Widget incomeTab() {
    return Column(
      children: [
        CommonContainer(
          height: 170.0,
          padding: const EdgeInsets.all(5.0),
          child: IncomeOneCandleBarChart(incomeData: widget.data2),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const CommonText(
            text: "Categories",
            size: 20.0,
            weight: FontWeight.w500,
            color: Colors.white),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.4,
          child: pieChart(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: FirebaseAnimatedList(
              reverse: false,
              defaultChild: const Center(child: CircularProgressIndicator()),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              query: _reference,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map contact = snapshot.value as Map;
                contact['key'] = snapshot.key;
                return _addIncomeCategoryItem(category: contact);
              }),
        ),
      ],
    );
  }

  Widget _addExpenseCategoryItem({required Map category}) {
    return category['categoryName'] == "Expense"
        ? Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/WalletPage/bg.png")),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff1C1F22), Color(0xff2C3036)],
                  ),
                  border: Border.all(
                      color: const Color(0xff000000).withOpacity(0.05),
                      width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff1F2427).withOpacity(0.3),
                        // color: Colors.red.withOpacity(0.8),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: const Offset(4, 4)),
                    BoxShadow(
                        color: const Color(0xff484E53).withOpacity(0.2),
                        // color: Colors.yellow.withOpacity(0.6),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: const Offset(-2, -4)),
                  ],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff11A8FD),
                                  Color(0xff0081C9),
                                ],
                              ),
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(category['icon'],
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: category['mainCategory'],
                                size: 16.0,
                                weight: FontWeight.w500,
                                color: Colors.white),
                            const SizedBox(
                              height: 5.0,
                            ),
                            CommonText(
                                text: category['date'],
                                size: 13.0,
                                weight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.3)),
                            const SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // widget.data.fold[0,priv+element.]
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: category['categoryName'] == "Expense"
                        ? CommonText(
                            text: "-${category['amount']}",
                            size: 18.0,
                            weight: FontWeight.w600,
                            color: redColor)
                        : CommonText(
                            text: category['amount'],
                            size: 18.0,
                            weight: FontWeight.w600,
                            color: greenColor),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }

  Widget _addIncomeCategoryItem({required Map category}) {
    return category['categoryName'] == "Income"
        ? Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/WalletPage/bg.png")),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff1C1F22), Color(0xff2C3036)],
                  ),
                  border: Border.all(
                      color: const Color(0xff000000).withOpacity(0.05),
                      width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff1F2427).withOpacity(0.3),
                        // color: Colors.red.withOpacity(0.8),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: const Offset(4, 4)),
                    BoxShadow(
                        color: const Color(0xff484E53).withOpacity(0.2),
                        // color: Colors.yellow.withOpacity(0.6),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: const Offset(-2, -4)),
                  ],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xffFF935F),
                                  Color(0xffFE684D),
                                ],
                              ),
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(category['icon'],
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: category['mainCategory'],
                                size: 16.0,
                                weight: FontWeight.w500,
                                color: Colors.white),
                            const SizedBox(
                              height: 5.0,
                            ),
                            CommonText(
                                text: category['date'],
                                size: 13.0,
                                weight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.3)),
                            const SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // widget.data.fold[0,priv+element.]
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: category['categoryName'] == "Expense"
                        ? CommonText(
                            text: "-${category['amount']}",
                            size: 18.0,
                            weight: FontWeight.w600,
                            color: redColor)
                        : CommonText(
                            text: category['amount'],
                            size: 18.0,
                            weight: FontWeight.w600,
                            color: greenColor),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff28B2FF),
            value: 48.8,
            title: '48.8%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffFFA05C),
            value: 24.7,
            title: '24.7',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffC21FEE),
            value: 10.2,
            title: '10.2%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 16.2,
            title: '16.2%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }

  Widget pieChart() {
    return Row(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff2C3036), Color(0xff1C1F22)],
                    ),
                    border: Border.all(
                        color: const Color(0xff000000).withOpacity(0.05),
                        width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1F2427).withOpacity(0.8),
                          // color: Colors.red.withOpacity(0.8),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: const Offset(4, 4)),
                      BoxShadow(
                          color: const Color(0xff484E53).withOpacity(0.6),
                          // color: Colors.yellow.withOpacity(0.6),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: const Offset(-2, -4)),
                    ],
                    shape: BoxShape.circle),
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 5,
                      centerSpaceRadius: 45,
                      sections: showingSections()),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff28B2FF),
                  text: '48.9%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xffFFA05C),
                  text: '24.7%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xff3EF190),
                  text: '16.2%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xffC21FEE),
                  text: '10.2%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xff28B2FF),
                  text: '48.9%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xffFFA05C),
                  text: '24.7%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xff3EF190),
                  text: '16.2%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xffC21FEE),
                  text: '10.2%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xff28B2FF),
                  text: '48.9%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xffFFA05C),
                  text: '24.7%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xff3EF190),
                  text: '16.2%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Indicator(
                  color: Color(0xffC21FEE),
                  text: '10.2%',
                  isSquare: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 28,
        ),
      ],
    );
  }
}
