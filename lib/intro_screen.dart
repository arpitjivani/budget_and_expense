import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/sign_in_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);

    slides = getSlides();
    _referenceLabels = FirebaseDatabase.instance.ref().child('Labels');
    saveLabels1();
    saveLabels2();
    saveLabels3();
    saveLabels4();
  }

  late DatabaseReference _referenceLabels;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    // contents of slider
                    return Slider(
                      text: slides[index].getText(),
                      title: slides[index].getTitle(),
                      bg: slides[index].getBGImage(),
                    );
                  }),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      slides.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        if (currentIndex == slides.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                          );
                        }else if(currentIndex != slides.length - 1){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                          );
                        }
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeOut);
                      },
                      child: CommonText(
                        text: currentIndex == slides.length - 1
                            ? "Continue"
                            : "Skip",
                        weight: FontWeight.w500,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void saveLabels1() {
    Map<void, void> contact = {
      'LabelName': "Coffee",
    };
    _referenceLabels.push().set(contact).then((value) {});
  }

  void saveLabels2() {
    Map<void, void> contact = {
      'LabelName': "Shopping",
    };
    _referenceLabels.push().set(contact).then((value) {});
  }

  void saveLabels3() {
    Map<void, void> contact = {
      'LabelName': "Food",
    };
    _referenceLabels.push().set(contact).then((value) {});
  }

  void saveLabels4() {
    Map<void, void> contact = {
      'LabelName': "Transport",
    };
    _referenceLabels.push().set(contact).then((value) {});
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
    );
  }
}

class Slider extends StatefulWidget {
  String bg;
  String text;
  String title;

  Slider({
    Key? key,
    required this.bg,
    required this.text,
    required this.title,
  }) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(widget.bg,
            width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.only(bottom: 130.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                CommonText(
                  text: widget.text,
                  align: TextAlign.start,
                  color: Colors.white,
                  size: 30.0,
                  weight: FontWeight.w700,
                  maxLine: 3,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CommonText(
                  align: TextAlign.start,
                  text: widget.title,
                  color: Colors.white.withOpacity(0.5),
                  size: 15.0,
                  weight: FontWeight.w300,
                  maxLine: 3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SliderModel {
  String bgimage;
  String text;
  String title;

// images given
  SliderModel({
    required this.bgimage,
    required this.text,
    required this.title,
  });

// setter for image
  void setImage(String getText, String getTitle, String getBGImage) {
    bgimage = getBGImage;
    text = getText;
    title = getTitle;
  }

// getter for image

  String getBGImage() {
    return bgimage;
  }

  String getText() {
    return text;
  }

  String getTitle() {
    return title;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel(
    bgimage: '',
    text: "text",
    title: "title",
  );

  // 1
  sliderModel.setImage(
      "Manage Your\nExpenses more easily",
      "Get Complete control over your expenses \n& save as much as you want.",
      "assets/intro_bg_1.png");
  slides.add(sliderModel);
  sliderModel = SliderModel(
    bgimage: '',
    text: "text",
    title: "title",
  );

  // 2
  sliderModel.setImage(
      "Expense Your money\ncategory wise",
      "Add Category and spend money overthere\nwith different budget.",
      "assets/intro_bg_2.png");
  slides.add(sliderModel);
  sliderModel = SliderModel(
    bgimage: '',
    text: "text",
    title: "title",
  );

  // 3
  sliderModel.setImage(
      "Watch Your monthly\nexpenses by chart",
      "Explore your saving & expenses by montly,\nweekly chart and saving more...",
      "assets/intro_bg_3.png");
  slides.add(sliderModel);
  sliderModel = SliderModel(
    bgimage: '',
    text: "text",
    title: "title",
  );

  return slides;
}
