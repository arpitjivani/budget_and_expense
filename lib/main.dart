// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spendee_budget_and_expense/Screens/splash_screen.dart';
import 'package:spendee_budget_and_expense/utils/class_builder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences.setMockInitialValues({});
  ClassBuilder.registerClasses();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static const String title = 'Budget And Expense App';

  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        navigatorKey: navigatorKey,
        home: SplashScreen(),
        // home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> itemList;
  List<Item> selectedList;

  @override
  void initState() {
    loadList();
    super.initState();
  }

  loadList() {
    itemList = [];
    selectedList = [];
    itemList.add(Item("assets/category.png", 1));
    itemList.add(Item("assets/category.png", 2));
    itemList.add(Item("assets/category.png", 3));
    itemList.add(Item("assets/category.png", 4));
    itemList.add(Item("assets/category.png", 5));
    itemList.add(Item("assets/category.png", 6));
    itemList.add(Item("assets/category.png", 7));
    itemList.add(Item("assets/category.png", 8));
    itemList.add(Item("assets/category.png", 9));
    itemList.add(Item("assets/category.png", 10));
    itemList.add(Item("assets/category.png", 11));
    itemList.add(Item("assets/category.png", 12));
    itemList.add(Item("assets/category.png", 13));
    itemList.add(Item("assets/category.png", 14));
    itemList.add(Item("assets/category.png", 15));
    itemList.add(Item("assets/category.png", 16));
    itemList.add(Item("assets/category.png", 17));
    itemList.add(Item("assets/category.png", 18));
    itemList.add(Item("assets/category.png", 19));
    itemList.add(Item("assets/category.png", 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: GridView.builder(
          itemCount: itemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.56,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          itemBuilder: (context, index) {
            return GridItem(
                item: itemList[index],
                isSelected: (bool value) {
                  setState(() {
                    if (value) {
                      selectedList.add(itemList[index]);
                    } else {
                      selectedList.remove(itemList[index]);
                    }
                  });
                  print("$index : $value");
                },
                key: Key(itemList[index].rank.toString()));
          }),
    );
  }

  getAppBar() {
    return AppBar(
      title: Text(selectedList.length < 1
          ? "Multi Selection"
          : "${selectedList.length} item selected"),
      actions: <Widget>[
        selectedList.length < 1
            ? Container()
            : InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < selectedList.length; i++) {
                      itemList.remove(selectedList[i]);
                    }
                    selectedList = List();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.delete),
                ))
      ],
    );
  }
}

class Item {
  String imageUrl;
  int rank;

  Item(this.imageUrl, this.rank);
}

class GridItem extends StatefulWidget {
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  GridItem({this.item, this.isSelected, this.key});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
        print("++++${widget.item.rank}");
      },
      child: Stack(
        children: <Widget>[
          Image.asset(
            widget.item.imageUrl,
            color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
            colorBlendMode: BlendMode.color,
          ),
          isSelected
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
