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

  static List<String> _list;
  @override
  void initState() {
    super.initState();
    _list = map.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nasa Technical Terms"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, int i) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(_list[i][0]),
              ),
              title: Text(
                "${_list[i]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              subtitle: Text(
                map[_list[i]],
                style: TextStyle(fontSize: 15.0),
              ),
              contentPadding: EdgeInsets.all(5.0),
              onTap: () =>
                  Navigator.of(context).push(view(_list[i], _list, map)),
            ),
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        isExtended: true,
        tooltip: "Search it out !",
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.of(context).push(
            buildMaterialSearchPage(context, _list),
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
