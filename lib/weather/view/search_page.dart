import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage._();

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const SearchPage._());
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SEARCH_INITIAL_TEXT = '';
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = SEARCH_INITIAL_TEXT;
  }

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('City Search')),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                            labelText: 'City', hintText: 'New York'))),
              ),
              IconButton(
                key: const Key('searchPage_search_iconButton'),
                icon: const Icon(Icons.search, semanticLabel: 'Submit'),
                onPressed: () {
                  print('[search_page] _text: ${_text}');
                  if (_text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Please enter a city name'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'))
                            ],
                          );
                        });
                  } else {
                    Navigator.of(context).pop(_text);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop('Chicago'),
                  child: const Text('Chicago')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop('Los Angeles'),
                  child: const Text('Los Angeles')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop('Miami'),
                  child: const Text('Miami')),
            ],
          ),
        ]));
  }
}
