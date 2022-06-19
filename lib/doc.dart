import 'package:module_3/customized.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class Documentations extends StatefulWidget {
  const Documentations({Key? key}) : super(key: key);

  @override
  State<Documentations> createState() => _DocumentationsState();
}

class _DocumentationsState extends State<Documentations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Documentations'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Link(
              uri: Uri.parse('https://dart.dev/guides'),
              target: LinkTarget.blank,
              builder: (context, followLink) =>
                  myBtn(tittle: 'Dart', onPressed: followLink),
            ),
            const SizedBox(height: 50),
            Link(
              uri: Uri.parse('https://docs.oracle.com/javase/8/docs/'),
              target: LinkTarget.blank,
              builder: (context, followLink) =>
                  myBtn(tittle: 'Java', onPressed: followLink),
            ),
            const SizedBox(height: 50),
            Link(
              uri: Uri.parse(
                  'https://docs.microsoft.com/en-us/cpp/standard-library/cpp-standard-library-reference?view=msvc-170'),
              target: LinkTarget.blank,
              builder: (context, followLink) =>
                  myBtn(tittle: 'C++', onPressed: followLink),
            ),
            const SizedBox(height: 50),
            Link(
              uri: Uri.parse('https://devdocs.io/javascript/'),
              target: LinkTarget.blank,
              builder: (context, followLink) =>
                  myBtn(tittle: 'JavaScript', onPressed: followLink),
            ),
            const SizedBox(height: 50),
            Link(
              uri: Uri.parse('https://kotlinlang.org/docs/home.html'),
              target: LinkTarget.blank,
              builder: (context, followLink) =>
                  myBtn(tittle: 'Kotlin', onPressed: followLink),
            ),
            const SizedBox(height: 50),
            Link(
              uri: Uri.parse('https://www.php.net/docs.php'),
              target: LinkTarget.blank,
              builder: (context, followLink) =>
                  myBtn(tittle: 'PHP', onPressed: followLink),
            ),
            const SizedBox(height: 50),
            Link(
              uri: Uri.parse('https://docs.python.org/3/'),
              target: LinkTarget.blank,
              builder: (context, followLink) =>
                  myBtn(tittle: 'Python', onPressed: followLink),
            ),
          ],
        ),
      ),
    );
  }
}
