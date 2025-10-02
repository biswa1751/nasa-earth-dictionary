import 'package:flutter/material.dart';
import 'package:nasa/screens/view_image/image.dart';

class MeaningPage extends StatelessWidget {
  final String text;
  final List list;
  final Map map;

  const MeaningPage({
    super.key,
    required this.text,
    required this.list,
    required this.map,
  });

  bool check(String text) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == text) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onPrimaryContainer;
    final bgColor = theme.colorScheme.primaryContainer;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Definition"),
        centerTitle: true,
        elevation: 2,
      ),
      body: check(text)
          ? SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Word Container
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Meaning list
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.55,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: map[text].split(" ").length,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      itemBuilder: (context, i) {
                        final word = map[text].split(" ")[i];
                        if (word != "or") {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ViewPhoto(text: word),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  word,
                                  style: const TextStyle(fontSize: 28),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Column(
                            children: const [
                              SizedBox(height: 12),
                              Text(
                                "OR",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          );
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Footer hint
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      "Tap on a word to view its image",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                "Not Found\nTry another word",
                style: theme.textTheme.titleLarge?.copyWith(color: Colors.redAccent),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
