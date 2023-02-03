import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: const Text("Choose Date"),
            ),
            Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text('Photo'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        );
                      });
                },
                child: const Text("Hello")),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      fontFamily: "SpaceFont",
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      height: MediaQuery.of(context).size.height / 3,
      styleDatePicker: MaterialRoundedDatePickerStyle(
        backgroundPicker: mainBG1,
        backgroundActionBar: mainBG1,
        backgroundHeaderMonth: mainBG1,
        textStyleDayHeader: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: "SpaceFont",
        ),
        textStyleDayOnCalendarSelected: const TextStyle(
            fontFamily: "SpaceFont",
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        decorationDateSelected: const BoxDecoration(
            color: Color(0xff058DD9), shape: BoxShape.circle),
        textStyleDayOnCalendar: TextStyle(
          fontSize: 18.0,
          color: Colors.white.withOpacity(0.5),
          fontFamily: "SpaceFont",
        ),
        textStyleMonthYearHeader: const TextStyle(
            fontSize: 16,
            fontFamily: "SpaceFont",
            color: Colors.white,
            fontWeight: FontWeight.bold),
        textStyleCurrentDayOnCalendar: const TextStyle(
            fontFamily: "SpaceFont",
            fontSize: 20.0,
            color: Color(0xff058DD9),
            fontWeight: FontWeight.bold),
        sizeArrow: 30,
        colorArrowNext: const Color(0xff058DD9),
        colorArrowPrevious: const Color(0xff058DD9),
        marginTopArrowPrevious: 16,
        paddingDatePicker: const EdgeInsets.all(0),
        paddingMonthHeader: const EdgeInsets.all(16),
        paddingActionBar: const EdgeInsets.all(16),
        textStyleButtonPositive: const TextStyle(
          fontSize: 14,
          color: Color(0xff058DD9),
          fontFamily: "SpaceFont",
        ),
        textStyleButtonNegative: TextStyle(
          fontSize: 14,
          color: Colors.white.withOpacity(0.5),
          fontFamily: "SpaceFont",
        ),
      ),
      styleYearPicker: MaterialRoundedYearPickerStyle(
        textStyleYear: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.5),fontFamily: "SpaceFont",),
        textStyleYearSelected: const TextStyle(
            fontFamily: "SpaceFont",
            fontSize: 20, color: Color(0xff058DD9), fontWeight: FontWeight.bold),
        heightYearRow: 50,
        backgroundPicker: mainBG1,
      ),
      theme: ThemeData(
          primarySwatch: const MaterialColor(
        0xff353A40,
        <int, Color>{
          50: Color(0xff353A40),
          100: Color(0xff353A40),
          200: Color(0xff353A40),
          300: Color(0xff353A40),
          400: Color(0xff353A40),
          500: Color(0xff353A40),
          600: Color(0xff353A40),
          700: Color(0xff353A40),
          800: Color(0xff353A40),
          900: Color(0xff353A40),
        },
      )),
    );

    print(selectedDate);
    if (newDateTime != null) {
      setState(() => selectedDate = newDateTime);
    }

  }
}

// showDatePicker(
// context: context,
// initialDate: DateTime.now(),
// firstDate: DateTime(2010),
// lastDate: DateTime.now(),
// builder: (context, child) {
// return Theme(
// data: ThemeData.dark().copyWith(
// colorScheme: const ColorScheme.dark(
// onPrimary: Colors.black, // selected text color
// onSurface: Colors.amberAccent, // default text color
// primary: Colors.amberAccent // circle color
// ),
// dialogBackgroundColor: Colors.black54,
// textButtonTheme: TextButtonThemeData(
// style: TextButton.styleFrom(
// textStyle: const TextStyle(
// color: Colors.amber,
// fontWeight: FontWeight.normal,
// fontSize: 12,
// fontFamily: 'Quicksand'),
// primary: Colors.amber, // color of button's letters
// backgroundColor: Colors.black54, // Background color
// shape: RoundedRectangleBorder(
// side: const BorderSide(
// color: Colors.transparent,
// width: 1,
// style: BorderStyle.solid),
// borderRadius: BorderRadius.circular(50))))),
// child: child!,
// );
// });
