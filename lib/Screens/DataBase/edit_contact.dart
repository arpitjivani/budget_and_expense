import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditContact extends StatefulWidget {
  String contactKey;

  EditContact({Key? key, required this.contactKey}) : super(key: key);

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  late final TextEditingController _nameController;
  late final TextEditingController _numberController;

  String _typeSelected = '';

  late DatabaseReference _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: widget.contactKey);
    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('IncomeAndExpanse');
    getContactDetail();
  }

  getContactDetail() async {
    DataSnapshot snapshot =
        (await _ref.child(widget.contactKey).once()) as DataSnapshot;

    Map contact = snapshot.value as Map;

    _nameController.text = contact['name'];

    _numberController.text = contact['number'];

    setState(() {
      _typeSelected = contact['type'];
    });
  }

  showData() {
    _ref.child(widget.contactKey).get().then((snapshot) {
      print("========${snapshot.value}");
      Fluttertoast.showToast(msg: snapshot.value.toString());
    });

    _ref.child(widget.contactKey).orderByChild(widget.contactKey).get().then((snapshot3) {
      print("++++++++${snapshot3.value}");
    });

    _ref.child(widget.contactKey).orderByChild(widget.contactKey).get().then((snapshot3) {
      print("++++++++${snapshot3.value}");
    });
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contact'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Name',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _numberController,
              decoration: const InputDecoration(
                hintText: 'Enter Number',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildContactType('Income'),
                  const SizedBox(width: 10),
                  _buildContactType('Expanse'),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                child: const Text(
                  'Update Contact',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  // saveContact();
                  showData();
                },
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveContact() {
    String name = _nameController.text;
    String number = _numberController.text;

    Map<String, String> contact = {
      'name': name,
      'number': number,
      'type': _typeSelected,
    };

    _ref.child(widget.contactKey).update(contact).then((value) {
      Navigator.pop(context);
    });
  }
}
