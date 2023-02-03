// import 'package:flutter/material.dart';
// import 'package:spendee_budget_and_expense/Demo/Calculator/Calculator_Screen.dart';
// import 'package:spendee_budget_and_expense/Demo/Date_Picker/date_picker.dart';
// import 'package:spendee_budget_and_expense/Demo/Pie_Chart/pie_chart_page.dart';
// import 'package:spendee_budget_and_expense/Demo/Progress_Bar/progress_bar.dart';
// import 'package:spendee_budget_and_expense/Screens/DataBase/my_contact_page.dart';
// import 'package:spendee_budget_and_expense/Screens/sign_in_screen.dart';
//
// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   _TestState createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   final List<Map> data = List.generate(100,
//       (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Test Screen")),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => const CalcButton(),
//               ));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//                 child: Text("Calculator Demo",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => DatePicker(),
//               ));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//                 child: Text("Date Picker Demo",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => const PieChartPage(),
//               ));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//                 child: Text("Pie Chart Demo",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => const ProgressBar(),
//               ));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//                 child: Text("Progress Bar",
//                     style: TextStyle(
//                         fontFamily: "SpaceFont",
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => const SignInScreen(),
//               ));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//                 child: Text("Sign In Screen",
//                     style: TextStyle(
//                         fontFamily: "SpaceFont",
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => const Contacts(),
//               ));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//                 child: Text("Data Base",
//                     style: TextStyle(
//                         fontFamily: "SpaceFont",
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MultiSelectscreen extends StatefulWidget {
  @override
  _MultiSelectscreenState createState() => _MultiSelectscreenState();
}

class _MultiSelectscreenState extends State<MultiSelectscreen> {
  List<Course> corcess = List.empty(growable: true);
  bool selectAll = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    corcess.add(Course("Swift", false));
    corcess.add(Course("Angular", false));
    corcess.add(Course("BootStrap", false));
    corcess.add(Course("CSS", false));
    corcess.add(Course("Eclipse", false));
    corcess.add(Course("Fullstack Web", false));
    corcess.add(Course("JQuery", false));
    corcess.add(Course(".Net", false));
    corcess.add(Course("ADO .Net", false));
    corcess.add(Course("Phython", false));
    corcess.add(Course("Salesforece", false));
    corcess.add(Course("SpringBoot", false));
    corcess.add(Course("Tableu", false));
    corcess.add(Course("Docker", false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                value: selectAll,
                onChanged: (bool? value) {
                  setState(() {
                    selectAll = value!;
                    corcess.forEach((element) {
                      element.selected = value;
                    });
                  });
                }),
            GridView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return prepareList(index);
              },
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: corcess.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget prepareList(int k) {
    return Card(
      child: Hero(
        tag: "text$k",
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Container(
              color: Colors.blueGrey,
              height: 100,
              child: Stack(
                children: [
                  Center(
                      child: Text(
                    corcess[k].name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  Positioned(
                      child: Checkbox(
                    value: corcess[k].selected,
                    onChanged: (bool? value) {
                      setState(() {
                        if (!value!) selectAll = false;
                        corcess[k].selected = value;
                        print(corcess[k].selected);
                      });
                    },
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Course {
  String name;
  bool selected;

  Course(this.name, this.selected);
}
