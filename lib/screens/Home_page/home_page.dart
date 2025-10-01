import 'package:flutter/material.dart';
import 'package:nasa/data/data.dart';
import 'package:nasa/helpers/extensions.dart';
import 'package:nasa/screens/Home_page/app_drawer.dart';
import 'package:nasa/screens/meaning/meaning.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.themechange}) : super(key: key);
  final Function themechange;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static List<String> _abbreviationKeys = [];
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _abbreviationKeys = abbreviations.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NASA Dictionary"),
        actions: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.rocket_launch,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              onPressed: () {
                // You can add functionality here
              },
            ),
          )
        ],
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      drawer: AppDrawer(
        themechanged: () {
          widget.themechange();
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: _controller,
              onChanged: (t) {
                if (t.isEmpty) {
                  _abbreviationKeys = abbreviations.keys.toList();
                } else {
                  _abbreviationKeys = abbreviations.keys
                      .where((element) =>
                          element.toLowerCase().contains(t.toLowerCase()) ||
                          (abbreviations[element]
                                  ?.toLowerCase()
                                  .contains(t.toLowerCase()) ??
                              false))
                      .toList();
                }
                setState(() {});
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceVariant
                    .withOpacity(0.3),
                hintText: 'Search abbreviations or definitions...',
                hintStyle: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.6),
                ),
                prefixIcon: const Icon(Icons.search_rounded),
                isDense: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    _abbreviationKeys = abbreviations.keys.toList();
                    FocusScope.of(context).unfocus();
                    setState(() {});
                    _controller.clear();
                  },
                  icon: const Icon(Icons.clear_rounded),
                ),
              ),
            ),
          ),
          Flexible(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: _abbreviationKeys.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Card(
                      elevation: 4,
                      shadowColor:
                          Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _abbreviationKeys[i][0],
                            style: context.textTheme.titleLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          _abbreviationKeys[i],
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            abbreviations[_abbreviationKeys[i]] ?? '',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              height: 1.3,
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MeaningPage(
                              text: _abbreviationKeys[i],
                              list: _abbreviationKeys,
                              map: abbreviations,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
