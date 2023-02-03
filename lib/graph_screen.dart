// import 'package:flutter/material.dart';
//
// const double borderRadius = 25.0;
//
// class dlog extends StatefulWidget {
//   @override
//   _dlogState createState() => _dlogState();
// }
//
// class _dlogState extends State<dlog>
//     with SingleTickerProviderStateMixin {
//   late PageController _pageController;
//   int activePageIndex = 0;
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       physics: const ClampingScrollPhysics(),
//       child: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: _menuBar(context),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: PageView(
//                   controller: _pageController,
//                   physics: const ClampingScrollPhysics(),
//                   onPageChanged: (int i) {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     setState(() {
//                       activePageIndex = i;
//                     });
//                   },
//                   children: <Widget>[
//                     ConstrainedBox(
//                       constraints: const BoxConstraints.expand(),
//                       child: Center(
//                         child: Text("Place Bid"),
//                       ),
//                     ),
//                     ConstrainedBox(
//                       constraints: const BoxConstraints.expand(),
//                       child: Center(
//                         child: Text("Buy Now"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
//
//   Widget _menuBar(BuildContext context) {
//     return Container(
//       width: 300.0,
//       height: 50.0,
//       decoration: const BoxDecoration(
//         color: Color(0XFFE0E0E0),
//         borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Expanded(
//             child: InkWell(
//               borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//               onTap: _onPlaceBidButtonPress,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.symmetric(vertical: 15),
//                 alignment: Alignment.center,
//                 decoration: (activePageIndex == 0)
//                     ? const BoxDecoration(
//                         color: Colors.green,
//                         borderRadius:
//                             BorderRadius.all(Radius.circular(borderRadius)),
//                       )
//                     : null,
//                 child: Text(
//                   "Place Bid",
//                   style: (activePageIndex == 0)
//                       ? TextStyle(color: Colors.white)
//                       : TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: InkWell(
//               borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
//               onTap: _onBuyNowButtonPress,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.symmetric(vertical: 15),
//                 alignment: Alignment.center,
//                 decoration: (activePageIndex == 1)
//                     ? const BoxDecoration(
//                         color: Colors.green,
//                         borderRadius:
//                             BorderRadius.all(Radius.circular(borderRadius)),
//                       )
//                     : null,
//                 child: Text(
//                   "Buy Now",
//                   style: (activePageIndex == 1)
//                       ? TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold)
//                       : TextStyle(
//                           color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onPlaceBidButtonPress() {
//     _pageController.animateToPage(0,
//         duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
//   }
//
//   void _onBuyNowButtonPress() {
//     _pageController.animateToPage(1,
//         duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
//   }
// }