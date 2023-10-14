import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Made By",
              style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Raunak Agarwal\nRohit Kapoor\nUtkarsh Raj\nBiswajit Behera",
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
