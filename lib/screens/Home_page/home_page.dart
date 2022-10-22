import 'package:flutter/material.dart';
import 'package:nasa/data/data.dart';
import 'package:nasa/screens/Home_page/widgets/drawer.dart';
import 'package:nasa/screens/meaning/meaning.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        title: const Text("NASA Abbreviations"),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: _controller,
              onChanged: (t) {
                _abbreviationKeys = abbreviations.keys
                    .where((element) => element.startsWith(t))
                    .toList();
                setState(() {});
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Type Something',
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    _abbreviationKeys = abbreviations.keys.toList();
                    setState(() {});
                    _controller.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: _abbreviationKeys.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 10),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(_abbreviationKeys[i][0]),
                      ),
                    ),
                    title: Text(
                      _abbreviationKeys[i],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    subtitle: Text(
                      abbreviations[_abbreviationKeys[i]] ?? '',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    contentPadding: const EdgeInsets.all(5.0),
                    onTap: () => Navigator.of(context).push(
                      findMeaning(_abbreviationKeys[i], _abbreviationKeys,
                          abbreviations, context),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
