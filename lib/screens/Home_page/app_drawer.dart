import 'package:flutter/material.dart';
import 'package:nasa/gen/assets.gen.dart';
import 'package:nasa/screens/about_page/about_screen.dart';
import 'package:nasa/screens/help_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key, required this.themechanged});

  final Function themechanged;
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Assets.happy.image(),
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
            leading: const Icon(Icons.radio_button_checked_outlined),
            title: const Text("Dark Theme"),
            trailing: Checkbox(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (value) {
                  widget.themechanged();
                }),
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
                      child: const Column(
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
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text(" Help "),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HelpScreen()),
            ),
          ),
          const Divider(height: 10.0),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("App Version 1.0.0"),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: 'Nasa Abbreviations',
              applicationVersion: '1.0.0',
            ),
          ),
        ],
      ),
    );
  }
}
