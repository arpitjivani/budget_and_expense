import 'package:flutter/material.dart';

class MyColorPicker extends StatefulWidget {
  // This function sends the selected color to outside
  final Function onSelectColor;
  final Function onSelectColor2;

  // List of pickable colors
  final List<Color> availableColors;
  final List<Color> availableColors2;

  // The default picked color
  final Color initialColor;

  // Determnie shapes of color cells
  final bool circleItem;

  const MyColorPicker(
      {Key? key,
      required this.onSelectColor,
      required this.availableColors,
      required this.initialColor,
      this.circleItem = true,
      required this.availableColors2,
      required this.onSelectColor2})
      : super(key: key);

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  // This variable used to determine where the checkmark will be
  late Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];
          final itemColor2 = widget.availableColors2[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () {
                widget.onSelectColor(itemColor);
                widget.onSelectColor2(itemColor2);
                setState(() {
                  _pickedColor = itemColor;
                  _pickedColor = itemColor2;
                });
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      itemColor,
                      itemColor2,
                    ],
                  ),
                  shape: widget.circleItem == true
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
