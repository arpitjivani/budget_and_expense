import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  String? text;
  dynamic icon;
  TextEditingController? controller;
  Color? fontColor;
  FontWeight? fontWeight;
  double? fontSize;
  dynamic keyboardType;

  CommonTextField(
      {Key? key,
      required this.text,
      required this.controller,
      required this.keyboardType,
      this.fontColor,
      this.fontWeight,
      this.icon,
      this.fontSize})
      : super(key: key);

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xff2F353A), Color(0xff1C1F22)],
          ),
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
          borderRadius: BorderRadius.circular(15.0)),
      child: TextField(
        keyboardType: widget.keyboardType,
        style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 16.0,
            fontFamily: "SpaceFont",
            fontWeight: FontWeight.w500),
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: widget.icon,
            hintText: widget.text,
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 16.0,
                fontFamily: "SpaceFont",
                fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.05),
                    width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.05),
                    width: 2))),
      ),
    );
  }
}
