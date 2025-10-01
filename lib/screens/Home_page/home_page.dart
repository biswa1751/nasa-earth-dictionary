import 'package:flutter/material.dart';
import 'package:nasa/data/data.dart';
import 'package:nasa/helpers/extensions.dart';
import 'package:nasa/screens/Home_page/app_drawer.dart';
import 'package:nasa/screens/meaning/meaning.dart';
import 'package:nasa/gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.themechange});
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
                    .surfaceContainerHighest
                    .withValues(alpha: 0.3),
                hintText: 'Search abbreviations or definitions...',
                hintStyle: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withValues(alpha: 0.6),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Row(
              children: [
                Icon(
                  Icons.list_alt_rounded,
                  size: 18,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  '${_abbreviationKeys.length} result${_abbreviationKeys.length == 1 ? '' : 's'}',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Scrollbar(
              child: _abbreviationKeys.isEmpty
                  ? _EmptyState()
                  : ListView.builder(
                      itemCount: _abbreviationKeys.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          child: Card(
                            elevation: 2,
                            shadowColor: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withValues(alpha: 0.08),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              leading: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  _abbreviationKeys[i][0],
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
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
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  abbreviations[_abbreviationKeys[i]] ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
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

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.happy.image(width: 120, height: 120),
            const SizedBox(height: 16),
            Text(
              'No results found',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different keyword or check your spelling.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
