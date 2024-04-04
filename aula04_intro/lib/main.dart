import 'package:flutter/material.dart';
import 'package:aula04_intro/flag.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Flag flags = Flag();
  int choices = 3;

  List<Widget> _buildGrideTileList(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < flags.deck.length; i++) {
      String response = flags.checkAnswer(i) ? "Acertou" : "Errou";

      children.add(Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        color: Colors.blue,
        child: GestureDetector(
          onTap: () {
            if (choices == 0) {
              _showDialog(context,
                  "Você não pode mais jogar nessa rodada. Deseja iniciar uma nova rodada?");
              return;
            }

            if (response == "Errou") {
              choices--;
              if (choices == 0) {
                _showDialog(context,
                    "Você errou e não tem mais tentativas. Deseja iniciar uma nova rodada?");
                return;
              } else {
                _showDialog(context,
                    "Você errou. Restam $choices tentativas. Deseja jogar novamente?");
                return;
              }
            }

            if (response == "Acertou" && choices != 0) {
              _showDialog(context,
                  "Você acertou. Restam $choices tentativas. Deseja jogar novamente?");
              return;
            }
          },
          child: Image.asset('assets/${flags.deck[i]}'),
        ),
      ));
    }

    return children;
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Resposta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                setState(() {
                  if (message.contains("Você acertou")) {
                    flags.resetGame();
                    choices = 3;
                  }
                  if (message
                          .contains("Você não pode mais jogar nessa rodada") ||
                      message
                          .contains("Você errou e não tem mais tentativas")) {
                    flags.resetGame();
                    choices = 3;
                  }
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Não'),
              onPressed: () {
                setState(() {
                  choices = 3;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
            Text("Qual a bandeira do ${flags.answer}"),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(choices.toString()),
            ),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3, children: _buildGrideTileList(context)),
            ),
          ],
        ),
      ),
    );
  }
}
