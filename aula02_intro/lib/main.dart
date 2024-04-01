import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String current = "";

  List<Widget> getChildren({@required rotulos}) {
    List<Widget> children = [];

    rotulos.forEach((item) {
      children.add(TextButton(
          onPressed: () {
            setState(() {
              current = item.toString();
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 20,
            width: 20,
            decoration:
                BoxDecoration(shape: BoxShape.rectangle, color: Colors.purple),
            child: Center(
              child: Text(
                item.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          )));
    });

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Click Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getChildren(rotulos: ["a", "b", "c", 1, 2, 3, 4, 5, 6]),
            ),
            Text(current),
          ],
        ),
      ),
    );
  }
}
