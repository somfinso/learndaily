import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learndaily/funtions/onlyimage.dart';
import 'package:learndaily/home.dart';
import 'list_pages.dart';

/// A simple, read-only GridView that displays documents from the
/// Firestore collection `template`. Each document should have a
/// string field `typename` which will be rendered in the grid tile.
class TemplatePageLink {
  const TemplatePageLink({required this.title, required this.builder});

  final String title;
  final Widget Function(Map<String, dynamic> data) builder;
}

class TemplateGrid extends StatelessWidget {
  const TemplateGrid({
    super.key,
    this.crossAxisCount = 2,
    this.useScaffold = true,
    this.title = 'Templates',
  });

  final int crossAxisCount;
  final bool useScaffold;
  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [SignagePage(), OnlyImagePage()];
    final CollectionReference<Map<String, dynamic>> templates =
        FirebaseFirestore.instance.collection('template');

    final Widget streamBuilder =
        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: templates.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final docs = snapshot.data?.docs ?? [];
            if (docs.isEmpty) {
              return const Center(child: Text('No templates found.'));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final data = docs[index].data();
                print(index);
                final typename = _readString(data, 'typename');

                return Card(
                  color: const Color.fromARGB(26, 56, 5, 173),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: const Color.fromARGB(60, 8, 6, 6),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      print(index); // Keeps your debug print
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pages[index]),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.widgets,
                            size: 36,
                            color: Colors.white70,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            typename.isEmpty ? 'Unnamed' : typename,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );

    if (useScaffold) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: streamBuilder,
      );
    }

    return streamBuilder;
  }

  static String _readString(Map<String, dynamic> data, String key) {
    final value = data[key];
    return value is String ? value : '';
  }
}

class TemplatePageSelection extends StatelessWidget {
  const TemplatePageSelection({
    super.key,
    required this.data,
    required this.pages,
  });

  final Map<String, dynamic> data;
  final List<TemplatePageLink> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select View')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: pages.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.white24),
        itemBuilder: (context, index) {
          final page = pages[index];
          return ListTile(
            title: Text(
              page.title,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white70,
              size: 18,
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => page.builder(data)));
            },
          );
        },
      ),
    );
  }
}
