import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final dynamic child;
  final dynamic width;
  final dynamic height;
  final dynamic padding;
  final dynamic margin;

  const CommonContainer(
      {Key? key, this.child, this.width, this.height, this.padding, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xff2C3036), Color(0xff1C1F22)],
          ),
          border: Border.all(color: const Color(0xff000000).withOpacity(0.05),width: 2),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1F2427).withOpacity(0.8),
                // color: Colors.red.withOpacity(0.8),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(4, 4)),
            BoxShadow(
                color: const Color(0xff484E53).withOpacity(0.6),
                // color: Colors.yellow.withOpacity(0.6),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(-2, -4)),
          ],
          borderRadius: BorderRadius.circular(20.0)),
      child: child,
    );
  }
}

class CommonContainer2 extends StatelessWidget {
  final dynamic child;
  final dynamic width;
  final dynamic height;
  final dynamic padding;
  final dynamic margin;

  const CommonContainer2(
      {Key? key, this.child, this.width, this.height, this.padding, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xff1C1F22), Color(0xff2C3036)],
          ),
          border: Border.all(color: const Color(0xff000000).withOpacity(0.05),width: 2),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1F2427).withOpacity(0.5),
                // color: Colors.red.withOpacity(0.8),
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(4, 4)),
            BoxShadow(
                color: const Color(0xff484E53).withOpacity(0.4),
                // color: Colors.yellow.withOpacity(0.6),
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(-2, -4)),
          ],
          borderRadius: BorderRadius.circular(20.0)),
      child: child,
    );
  }
}

