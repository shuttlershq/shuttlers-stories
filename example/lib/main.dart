import 'package:flutter/material.dart';
import 'package:shuttlers_stories/shuttlers_stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton.icon(
          onPressed: () => StoriesView.instance.show(
            context,
            pages: [
              Container(
                color: Colors.red,
                child: const Center(
                  child: Text("A"),
                ),
              ),
              Container(
                color: Colors.orange,
                child: const Center(
                  child: Text("B"),
                ),
              ),
              Container(
                color: Colors.yellow,
                child: const Center(
                  child: Text("C"),
                ),
              ),
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text("D"),
                ),
              ),
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text("E"),
                ),
              ),
            ],
          ),
          icon: const Icon(Icons.pages),
          label: const Text("Shuttlers stories"),
        ),
      ),
    );
  }
}
