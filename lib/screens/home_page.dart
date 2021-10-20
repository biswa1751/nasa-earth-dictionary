import 'package:flutter/material.dart';
import 'package:nasa/data/data.dart';
import 'package:nasa/screens/helpers/drawer.dart';
import 'package:nasa/screens/meaning.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //to view meaning when user submit in search

  static List<String> _abbreviationKeys = [];
  @override
  void initState() {
    super.initState();
    _abbreviationKeys = abbreviations.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NASA Abbreviations"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _abbreviationKeys.length,
        itemBuilder: (context, i) {
          return Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            elevation: 10,
            shadowColor: Colors.black.withOpacity(0.2),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: CircleAvatar(
                  child: Text(_abbreviationKeys[i][0]),
                ),
              ),
              title: Text(
                _abbreviationKeys[i],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              subtitle: Text(
                abbreviations[_abbreviationKeys[i]] ?? '',
                style: TextStyle(fontSize: 16.0),
              ),
              contentPadding: const EdgeInsets.all(5.0),
              onTap: () => Navigator.of(context).push(
                findMeaning(_abbreviationKeys[i], _abbreviationKeys,
                    abbreviations, context),
              ),
            ),
          );
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
