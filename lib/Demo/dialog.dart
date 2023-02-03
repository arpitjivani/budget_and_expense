// import 'package:flutter/material.dart';
// import 'package:spendee_budget_and_expense/Common_Widgets/common_container.dart';
// import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
//
// class CustomDialog extends StatelessWidget {
//   const CustomDialog({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: const EdgeInsets.all(25.0),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
//       elevation: 0.0,
//       backgroundColor: Colors.transparent,
//       child: dialogContent(context),
//     );
//   }
//
//   Widget dialogContent(BuildContext context) {
//     return CommonContainer(
//       height: MediaQuery.of(context).size.height/1.5,
//       width: MediaQuery.of(context).size.width,
//       child: Stack(
//         children: <Widget>[
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       CommonText(
//                           text: "Transaction Categories",
//                           size: 16.0,
//                           weight: FontWeight.w500,
//                           color: Colors.white),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: const Alignment(1.10, -1.10),
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomLeft,
//                       colors: [Color(0xff2C3036), Color(0xff1C1F22)],
//                     ),
//                     border: Border.all(
//                         color: const Color(0xff000000).withOpacity(0.05),
//                         width: 2),
//                     boxShadow: [
//                       BoxShadow(
//                           color: const Color(0xff1F2427).withOpacity(0.8),
//                           blurRadius: 10,
//                           spreadRadius: 0,
//                           offset: const Offset(4, 4)),
//                       BoxShadow(
//                           color: const Color(0xff484E53).withOpacity(0.6),
// // color: Colors.yellow.withOpacity(0.6),
//                           blurRadius: 10,
//                           spreadRadius: 0,
//                           offset: const Offset(-2, -4)),
//                     ],
//                     borderRadius: BorderRadius.circular(20.0)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.close,
//                     color: Colors.white.withOpacity(0.5),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_container.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  final dynamic width;
  final dynamic height;

  const AnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      width: widget.width,
      height: widget.height,
      margin: const EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              width: Get.width,
              height: Get.width * 0.13,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: CommonText(
                        text: widget.values[index],
                        size: 16.0,
                        weight: FontWeight.w500,
                        color: CupertinoColors.white),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: Get.width * 0.33,
              // height: Get.width * 0.13,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.5),
                      // color: Colors.red.withOpacity(0.8),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 0)),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                ),
              ),
              child: CommonText(
                  text: initialPosition ? widget.values[0] : widget.values[1],
                  size: 16.0,
                  weight: FontWeight.w500,
                  color: Colors.white),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
