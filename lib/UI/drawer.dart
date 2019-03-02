import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
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
      );
  }
}