import 'package:flutter/material.dart';
import 'package:nasa/screens/view_image/image.dart';

class MeaningPage extends StatelessWidget {
  final String text;
  final List list;
  final Map map;

  const MeaningPage({
    Key? key,
    required this.text,
    required this.list,
    required this.map,
  }) : super(key: key);
  bool check(String text) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == text) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Definition"),
        centerTitle: true,
      ),
      body: check(text)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
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
                                        " OR ",
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
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Click on text to get Image",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
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
