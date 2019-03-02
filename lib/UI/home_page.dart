import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:nasa/Data/data.dart';
import 'package:nasa/UI/meaning.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  //to view meaning when user submit in search
  void submit(String text) {
    text = text.toUpperCase();
    Navigator.of(context).push(view(text,_list,map));
  }

  _buildMaterialSearchPage(BuildContext context) {
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Search',
              results: _list
                  .map((String v) => new MaterialSearchResult<String>(
                        value: v,
                        text: "$v",
                      ))
                  .toList(),
              filter: (dynamic value, String criteria) {
                return value.toLowerCase().trim().contains(
                    new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) => submit(value.toString()),
              onSubmit: (String value) => submit(value),
            ),
          );
        });
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context).push(_buildMaterialSearchPage(context));
  }

  static List<String> _list = map.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nox"),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  subtitle: Text(
                    map[_list[i]],
                    style: TextStyle(fontSize: 15.0),
                  ),
                  contentPadding: EdgeInsets.all(5.0),
                  onTap: () => Navigator.of(context).push(view(_list[i],_list,map)),
                ),
              );
            }),
        floatingActionButton: new FloatingActionButton(
          isExtended: true,
          tooltip: "Search it out !",
          child: Icon(Icons.search),
          onPressed: () => _showMaterialSearch(context),
        ),
        drawer: new Drawer(
          child: Column(
            children: <Widget>[
              Container(child: Image.asset("asset/happy.gif")),
              ListTile(
                title: Text("About"),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text("About"),
                          ),
                          body: Center(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Made By",
                                    style: TextStyle(
                                        fontSize: 60.0,
                                        fontWeight: FontWeight.bold),
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
                          ),
                        ))),
              ),
              ListTile(
                title: Text("Sources"),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text("Sources"),
                          ),
                          body: Center(
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "https://www.nasa.gov/directorates/heo/scan/definitions/acronyms/index.html",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))),
              ),
              Divider(
                height: 10.0,
              )
            ],
          ),
        ));
  }
}
