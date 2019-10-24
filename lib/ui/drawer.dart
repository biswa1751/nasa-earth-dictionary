import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(
        children: <Widget>[
          Container(child: Image.asset("asset/happy.gif")),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About Us"),
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text("About Us"),
                          ),
                          body: Center(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Made By",
                                    style: TextStyle(
                                        fontSize: 63.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 52.5,
                                  ),
                                  Text(
                                    "Raunak Agarwal\nRohit Kapoor\nUtkarsh Raj\nBiswajit Behera\nSayantan Biswas",
                                    style: TextStyle(fontSize: 20.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Sources"),
            onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
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
                                      "1.https://www.nasa.gov/directorates/heo/scan/definitions/acronyms/index.html\n2.https://images-api.nasa.gov",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
          ),
          Divider(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
