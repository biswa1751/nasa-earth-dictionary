import 'package:flutter/material.dart';
import 'package:nasa/screens/about_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Image.asset("assets/happy.gif"),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About Us"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AboutScreen(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Sources"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Sources"),
                  ),
                  body: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
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
          const Divider(height: 10.0)
        ],
      ),
    );
  }
}
