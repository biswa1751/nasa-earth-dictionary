import 'package:flutter/material.dart';
import 'package:nasa/ui/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NASA Abbreviation',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purple,
      ),
      home: new MyHomePage(),
    );
  }
}
