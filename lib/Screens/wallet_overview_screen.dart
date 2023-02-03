import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Demo/Pie_Chart/samples/indicator.dart';
import 'package:spendee_budget_and_expense/Screens/edit_categories.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

class WalletOverview extends StatefulWidget {
  const WalletOverview({Key? key}) : super(key: key);

  @override
  State<WalletOverview> createState() => _WalletOverviewState();
}

class _WalletOverviewState extends State<WalletOverview> {
  late Query _reference;

  @override
  void initState() {
    super.initState();
    _reference = FirebaseDatabase.instance.ref().child('UserData');
  }

  int touchedIndex = -1;

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
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 80.0, right: 20.0, left: 20.0),
                      child: Column(
                        children: [
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
                          FirebaseAnimatedList(
                              reverse: false,
                              defaultChild: const Center(
                                  child: CircularProgressIndicator()),
                              physics: const AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              query: _reference,
                              itemBuilder: (BuildContext context,
                                  DataSnapshot snapshot,
                                  Animation<double> animation,
                                  int index) {
                                Map contact = snapshot.value as Map;
                                contact['key'] = snapshot.key;
                                return _addCategoryItem(category: contact);
                              }),
                        ],
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
                                  text: "Create New Category",
                                  size: 18.0,
                                  weight: FontWeight.w500,
                                  color: Colors.white),
                              const SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _addCategoryItem({required Map category}) {
    return InkWell(
      onTap: () async {
        bool isBack = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => EditCategories(
                      categoryKey: category['key'], uid: null,
                    )));
        print("isBack -> $isBack");
        // if (isBack != null && isBack && isBack == null) {
        // }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
                  color: const Color(0xff000000).withOpacity(0.05), width: 2),
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
                              // Color.fromARGB(
                              //     category['color1A'],
                              //     category['color1R'],
                              //     category['color1G'],
                              //     category['color1B']),
                              // Color.fromARGB(
                              //     category['color2A'],
                              //     category['color2R'],
                              //     category['color2G'],
                              //     category['color2B']),
                              Colors.red,
                              Colors.yellow
                            ],
                          ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:
                            Image.asset(category['icon'], color: Colors.white),
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
                            text: category['note'],
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
      ),
    );
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
