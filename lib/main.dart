import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faqeeh App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

// This class and widget handles the home page
class MyHomePage extends StatelessWidget {
  final nameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple App That Collect User Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              Text(
                'Enter Your Full Name',
                style: TextStyle(fontSize: 26),
              ),
              TextField(
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  var entered_name = nameController.text;
                  print("Name $entered_name");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (cotext) =>
                              WelcomeScreen(guestname: entered_name)));
                },
                child: Text(
                  'Click Here',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// This class and widget handles the welcome screen 
class WelcomeScreen extends StatelessWidget {
  final guestname;
  WelcomeScreen({@required this.guestname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network(
                'assets/hng.png',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  'Welome $guestname!',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                )),
          ],
        ),
      ),
    );
  }
}
