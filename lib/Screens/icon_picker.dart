import 'package:flutter/material.dart';

class MyIconPicker extends StatefulWidget {
  // This function sends the selected color to outside
  final Function onSelectIcon;

  // List of pickable colors
  final List<String> availableIcons;

  // The default picked color
  final Color initialColor;
  final String initialIcon;

  // Determnie shapes of color cells
  final bool circleItem;

  const MyIconPicker(
      {Key? key,
      required this.initialColor,
      this.circleItem = true,
      required this.onSelectIcon,
      required this.initialIcon,
      required this.availableIcons})
      : super(key: key);

  @override
  _MyIconPickerState createState() => _MyIconPickerState();
}

class _MyIconPickerState extends State<MyIconPicker> {
  // This variable used to determine where the checkmark will be
  late Color _pickedColor;
  late String _pickedIcon;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    _pickedIcon = widget.initialIcon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        children: List.generate(widget.availableIcons.length, (index) {
          final itemIcon = widget.availableIcons[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () {
                widget.onSelectIcon(itemIcon);
                setState(() {
                  _pickedIcon = itemIcon;
                });
              },
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
                        color: const Color(0xff1F2427).withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(4, 4)),
                    BoxShadow(
                        color: const Color(0xff484E53).withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(-2, -4)),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    itemIcon,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
