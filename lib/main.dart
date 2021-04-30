import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ibekason Alexander",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                child: ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
