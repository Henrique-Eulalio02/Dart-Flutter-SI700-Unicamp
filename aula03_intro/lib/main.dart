import 'package:aula03_intro/tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  Tip tip = new Tip();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Click Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              initialValue: tip.amount,
              keyboardType: TextInputType.number,
              onChanged: (String x) {
                setState(() {
                  tip.amount = x;
                });
              },
              decoration: const InputDecoration(labelText: 'Valor Total'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
              ],
            ),
            InputDecorator(
                decoration:
                    const InputDecoration(labelText: 'Gorjeta Customizada'),
                child: Slider(
                  min: 1,
                  max: 20,
                  value: double.parse(tip.customTip),
                  onChanged: (double x) {
                    setState(() {
                      tip.customTip = x.toString();
                    });
                  },
                )),
            Text(tip.defaultTippedAmount),
            Text(tip.customTippedAmount),
            Text(tip.customTip),
            Text(tip.amountPlusDefaultTippedAmount),
            Text(tip.amountPlusCustomTippedAmount),
          ],
        ),
      ),
    );
  }
}
