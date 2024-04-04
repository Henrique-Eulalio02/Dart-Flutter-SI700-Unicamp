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
  Tip t = new Tip();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Click Counter'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  initialValue: t.amount,
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    setState(() {
                      t.amount = value;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Valor Total'),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))
                  ],
                ),
                InputDecorator(
                  decoration:
                      const InputDecoration(labelText: 'Gorjeta Customizada'),
                  child: Slider(
                    min: 1,
                    max: 20,
                    value: double.parse(t.customTip),
                    onChanged: (double value) {
                      setState(() {
                        t.customTip = value.toString();
                      });
                    },
                  ),
                ),
                Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(3),
                  },
                  children: [
                    TableRow(children: [
                      TableCell(child: Text('Gorjeta Padrao')),
                      TableCell(child: Text(t.defaultTippedAmount)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Gorjeta Customizada')),
                      TableCell(child: Text(t.customTippedAmount)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Valor Total + Gorjeta Padrao')),
                      TableCell(child: Text(t.amountPlusDefaultTippedAmount)),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Text('Valor Total + Gorjeta Customizada')),
                      TableCell(child: Text(t.amountPlusCustomTippedAmount)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Gorjeta por Pessoa (Padr達o)')),
                      TableCell(child: Text(t.tipPerPersonDefault.toString())),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Text('Gorjeta por Pessoa (Customizada)')),
                      TableCell(child: Text(t.tipPerPersonCustom.toString())),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Text('Gorjeta por Pessoa (Total Padr達o)')),
                      TableCell(
                          child:
                              Text(t.tipPerPersonTotalTipDefault.toString())),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child:
                              Text('Gorjeta por Pessoa (Total Customizada)')),
                      TableCell(
                          child: Text(t.tipPerPersonTotalTipCustom.toString())),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
