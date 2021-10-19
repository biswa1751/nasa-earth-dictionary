import 'package:flutter/material.dart';
import 'package:nasa/data/data.dart';
import 'package:nasa/ui/drawer.dart';
import 'package:nasa/ui/meaning.dart';
import 'package:nasa/ui/search.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //to view meaning when user submit in search

  static List<String> _keysList = [];
  @override
  void initState() {
    super.initState();
    _keysList = wordData.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NASA Abbreviations"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _keysList.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(_keysList[i][0]),
              ),
              title: Text(
                _keysList[i],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              subtitle: Text(
                wordData[_keysList[i]] ?? '',
                style: TextStyle(fontSize: 16.0),
              ),
              contentPadding: EdgeInsets.all(5.0),
              onTap: () => Navigator.of(context).push(
                  findMeaning(_keysList[i], _keysList, wordData, context)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        tooltip: "Search it out !",
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.of(context).push(
            buildMaterialSearchPage(context, _keysList),
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
