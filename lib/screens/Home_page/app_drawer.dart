import 'package:flutter/material.dart';
import 'package:nasa/gen/assets.gen.dart';
import 'package:nasa/screens/about_page/about_screen.dart';
import 'package:nasa/screens/help_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key, required this.themechanged}) : super(key: key);

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
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Assets.happy.image(height: 60),
                const SizedBox(height: 8),
                Text(
                  'NASA Dictionary',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Space terminology at your fingertips',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
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
            leading: Icon(
              Theme.of(context).brightness == Brightness.dark 
                ? Icons.dark_mode 
                : Icons.light_mode,
            ),
            title: const Text("Theme"),
            subtitle: Text(
              Theme.of(context).brightness == Brightness.dark 
                ? "Dark Mode" 
                : "Light Mode",
            ),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                widget.themechanged();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.source),
            title: const Text("Sources"),
            subtitle: const Text("Data sources and references"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Sources"),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Data Sources",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.public),
                            title: const Text("NASA Acronyms"),
                            subtitle: const Text("Official NASA acronym definitions"),
                            trailing: const Icon(Icons.open_in_new),
                            onTap: () {
                              // You can add URL launcher functionality here
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text("NASA Images API"),
                            subtitle: const Text("NASA's image database"),
                            trailing: const Icon(Icons.open_in_new),
                            onTap: () {
                              // You can add URL launcher functionality here
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Help"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HelpScreen()),
            ),
          ),
          const Divider(height: 10.0),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("App Info"),
            subtitle: const Text("Version 1.0.0"),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: 'NASA Dictionary',
              applicationVersion: '1.0.0',
              applicationIcon: Assets.happy.image(height: 50),
              children: [
                const Text(
                  'A comprehensive NASA abbreviations dictionary for exploring space terminology.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
