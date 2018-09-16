import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:nasa/Data/data.dart';
import 'package:nasa/Data/image.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Nasa Technical Terms',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purple
      ),
      home: new MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool check(String text) {
    for (int i = 0; i < _list.length; i++) {
      if (_list[i] == text) return true;
    }
    return false;
  }

  MaterialPageRoute view(String text) {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(title: Text("Meaning")),
            body: check(text)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          text,
                          style: TextStyle(fontSize: 50.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 500.0,
                          width: 500.0,
                          child: ListView.builder(
                            itemCount: map[text].split(" ").length,
                            itemBuilder: (context, int i) => Center(
                                  child: InkWell(
                                      child:map[text].split(" ")[i]!="or" ?Text(
                                        map[text].split(" ")[i],
                                        style: TextStyle(fontSize: 30.0),
                                      ):Column(
                                        children: <Widget>[
                                          SizedBox(height: 15.0,),
                                          Text("OR",style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0
                                          ),),
                                          SizedBox(height: 15.0,),
                                        ],
                                      ),
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => ViewPhoto(
                                                  text: map[text]
                                                      .split(" ")[i])))),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text("Click on text to get Image")
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                    "Not Found",
                    style: TextStyle(fontSize: 20.0),
                  ))));
  }

  Widget _listMeaning(String text, BuildContext context) {
    List _wordList = text.split(" ");
    return ListView.builder(
      itemCount: _wordList.length,
      itemBuilder: (context, int i) => Text(_wordList[i]),
    );
  }

  void submit(String text) {
    text = text.toUpperCase();
    Navigator.of(context).push(view(text));
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
          title: Text("Nox "),
        ),
       // backgroundColor: Colors.grey[100],
        body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, int i) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(_list[i][0]),
                  ),
                  title: Text("${_list[i]}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),),
                  subtitle: Text(map[_list[i]],style: TextStyle(
                    fontSize: 15.0
                  ),),
                  contentPadding: EdgeInsets.all(5.0),
                  onTap: () => Navigator.of(context).push(view(_list[i])),
                ),
              );
            }),
        floatingActionButton: new FloatingActionButton(
          isExtended: true,
          tooltip: "Search it out !",
          child: Icon(Icons.search),
          // shape: const CircleBorder(side: BorderSide(width: 100.0,)),
          onPressed: () => _showMaterialSearch(context),
        ),
        drawer: new Drawer(
          child: Column(
            children: <Widget>[
              Container(
                child:Image.asset("asset/happy.gif")
              ),
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
