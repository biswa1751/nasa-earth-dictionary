import 'package:flutter/material.dart';
import 'package:nasa/screens/view_image/image.dart';

class MeaningPage extends StatelessWidget {
  final String text;
  final List list;
  final Map map;

  const MeaningPage({
    super.key,
    required this.text,
    required this.list,
    required this.map,
  });
  bool check(String text) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == text) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meaning")),
      body: check(text)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    style: const TextStyle(fontSize: 50.0),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 500.0,
                    width: 500.0,
                    child: ListView.builder(
                      itemCount: map[text].split(" ").length,
                      itemBuilder: (context, int i) => Center(
                        child: InkWell(
                            child: map[text].split(" ")[i] != "or"
                                ? Text(
                                    map[text].split(" ")[i],
                                    style: const TextStyle(fontSize: 30.0),
                                  )
                                : const Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        "OR",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                    ],
                                  ),
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ViewPhoto(
                                        text: map[text].split(" ")[i])))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Text(
                      "Click on  text to get Image",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
            )
          : const Center(
              child: Text(
                "Not Found\nTry another Word",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
    );
  }
}
