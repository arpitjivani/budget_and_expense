import 'package:flutter/material.dart';


class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Text(
                'Screen 2',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
              margin: const EdgeInsets.all(16),
            ),
            MaterialButton(
              elevation: 0.0,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}