import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_textfield.dart';

class CommonDialog extends StatefulWidget {
  final String title;
  final String subTitle;
  final dynamic cancelClick;
  final dynamic okClick;
  final String cancelButtonText;
  final String okButtonText;

  const CommonDialog(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.cancelClick,
      this.okClick,
      required this.cancelButtonText,
      required this.okButtonText})
      : super(key: key);

  @override
  _CommonDialogState createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.all(5.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff2C3036), Color(0xff1C1F22)],
                ),
                border: Border.all(
                    color: const Color(0xff000000).withOpacity(0.05), width: 2),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff1F2427).withOpacity(0.6),
                      // color: Colors.red.withOpacity(0.8),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(4, 4)),
                  BoxShadow(
                      color: const Color(0xff484E53).withOpacity(0.4),
                      // color: Colors.yellow.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(-2, -4)),
                ],
                borderRadius: BorderRadius.circular(20.0)),
            height: Get.height / 4,
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                CommonText(
                    text: widget.title,
                    size: 20.0,
                    weight: FontWeight.w500,
                    color: Colors.white),
                const SizedBox(
                  height: 10.0,
                ),
                CommonText(
                    text: widget.subTitle,
                    size: 16.0,
                    weight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.3)),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                        child: InkWell(
                          onTap: widget.cancelClick,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.5),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 0)),
                              ],
                              border: Border.all(
                                  width: 2.0,
                                  color:
                                      const Color(0xff2C3036).withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff1C1F22), Color(0xff2C3036)],
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13.0),
                                child: CommonText(
                                    text: widget.cancelButtonText,
                                    size: 16.0,
                                    weight: FontWeight.w700,
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: InkWell(
                          onTap: widget.okClick,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.5),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 0)),
                              ],
                              border: Border.all(
                                  width: 2.0, color: const Color(0xff11A8FD)),
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13.0),
                                child: CommonText(
                                    text: widget.okButtonText,
                                    size: 16.0,
                                    weight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class CommonDialogWithTextField extends StatefulWidget {
  final String title;
  final dynamic cancelClick;
  final dynamic okClick;
  final String cancelButtonText;
  final String okButtonText;
  final String textFieldText;
  final dynamic controller;
  final dynamic keyboardType;

  const CommonDialogWithTextField(
      {Key? key,
      required this.title,
      this.cancelClick,
      this.okClick,
      required this.cancelButtonText,
      required this.okButtonText,
      required this.textFieldText,
      this.controller,
      this.keyboardType})
      : super(key: key);

  @override
  _CommonDialogWithTextFieldState createState() =>
      _CommonDialogWithTextFieldState();
}

class _CommonDialogWithTextFieldState extends State<CommonDialogWithTextField> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.all(5.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff2C3036), Color(0xff1C1F22)],
                ),
                border: Border.all(
                    color: const Color(0xff000000).withOpacity(0.05), width: 2),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff1F2427).withOpacity(0.6),
                      // color: Colors.red.withOpacity(0.8),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(4, 4)),
                  BoxShadow(
                      color: const Color(0xff484E53).withOpacity(0.4),
                      // color: Colors.yellow.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(-2, -4)),
                ],
                borderRadius: BorderRadius.circular(20.0)),
            height: Get.height / 3.8,
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                CommonText(
                    text: widget.title,
                    size: 20.0,
                    weight: FontWeight.w500,
                    color: Colors.white),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CommonTextField(
                      text: widget.textFieldText,
                      controller: widget.controller,
                      icon: Icon(Icons.mode_edit_outlined,color: Colors.white.withOpacity(0.8)),
                      keyboardType: widget.keyboardType),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                        child: InkWell(
                          onTap: widget.cancelClick,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.5),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 0)),
                              ],
                              border: Border.all(
                                  width: 2.0,
                                  color:
                                      const Color(0xff2C3036).withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff1C1F22), Color(0xff2C3036)],
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13.0),
                                child: CommonText(
                                    text: widget.cancelButtonText,
                                    size: 16.0,
                                    weight: FontWeight.w700,
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: InkWell(
                          onTap: widget.okClick,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.5),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 0)),
                              ],
                              border: Border.all(
                                  width: 2.0, color: const Color(0xff11A8FD)),
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13.0),
                                child: CommonText(
                                    text: widget.okButtonText,
                                    size: 16.0,
                                    weight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ));
  }
}

class CommonDialogWithTextFieldIcon extends StatefulWidget {
  final dynamic cancelClick;
  final dynamic okClick;
  final String cancelButtonText;
  final String okButtonText;
  final String textFieldText;
  final dynamic controller;
  final dynamic keyboardType;
  final dynamic onIconTap;

  const CommonDialogWithTextFieldIcon(
      {Key? key,
      this.cancelClick,
      this.okClick,
      required this.cancelButtonText,
      required this.okButtonText,
      required this.textFieldText,
      this.controller,
      this.keyboardType,
      this.onIconTap})
      : super(key: key);

  @override
  _CommonDialogWithTextFieldIconState createState() =>
      _CommonDialogWithTextFieldIconState();
}

class _CommonDialogWithTextFieldIconState
    extends State<CommonDialogWithTextFieldIcon> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.all(5.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff2C3036), Color(0xff1C1F22)],
                ),
                border: Border.all(
                    color: const Color(0xff000000).withOpacity(0.05), width: 2),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff1F2427).withOpacity(0.6),
                      // color: Colors.red.withOpacity(0.8),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(4, 4)),
                  BoxShadow(
                      color: const Color(0xff484E53).withOpacity(0.4),
                      // color: Colors.yellow.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(-2, -4)),
                ],
                borderRadius: BorderRadius.circular(20.0)),
            height: Get.height / 3.8,
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
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
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextField(
                      keyboardType: widget.keyboardType,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16.0,
                          fontFamily: "SpaceFont",
                          fontWeight: FontWeight.w500),
                      controller: widget.controller,
                      decoration: InputDecoration(
                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 5,
                            minWidth: 5,
                          ),
                          suffixIcon: InkWell(
                            onTap: widget.onIconTap,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                "assets/Drawer/edit.png",
                              ),
                            ),
                          ),
                          hintText: widget.textFieldText,
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16.0,
                              fontFamily: "SpaceFont",
                              fontWeight: FontWeight.w500),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xff000000).withOpacity(0.05),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xff000000).withOpacity(0.05),
                                  width: 2))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                        child: InkWell(
                          onTap: widget.cancelClick,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.5),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 0)),
                              ],
                              border: Border.all(
                                  width: 2.0,
                                  color:
                                      const Color(0xff2C3036).withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff1C1F22), Color(0xff2C3036)],
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13.0),
                                child: CommonText(
                                    text: widget.cancelButtonText,
                                    size: 16.0,
                                    weight: FontWeight.w700,
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: InkWell(
                          onTap: widget.okClick,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xff000000)
                                        .withOpacity(0.5),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 0)),
                              ],
                              border: Border.all(
                                  width: 2.0, color: const Color(0xff11A8FD)),
                              borderRadius: BorderRadius.circular(20.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13.0),
                                child: CommonText(
                                    text: widget.okButtonText,
                                    size: 16.0,
                                    weight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ));
  }
}
