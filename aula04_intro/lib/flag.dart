import 'dart:math';

class Flag {
  final Random _random = new Random();
  int _currentCountry = 0;
  final _flags = [
    "South_America-Argentina.png",
    "South_America-Brazil.png",
    "South_America-Uruguay.png",
    "South_America-Venezuela.png",
    "South_America-Paraguay.png",
    "South_America-Peru.png",
    "South_America-Colombia.png",
    "South_America-Chile.png",
    "South_America-Bolivia.png",
    "South_America-Ecuador.png"
  ];

  Flag() {
    resetGame();
  }

  void resetGame() {
    _flags.shuffle();

    _currentCountry = _random.nextInt(6);
  }

  List get deck {
    return _flags.sublist(0, 6);
  }

  String get answer {
    return _flags[_currentCountry].split("-")[1].split(".")[0];
  }

  bool checkAnswer(int x) {
    if (x == _currentCountry) {
      return true;
    } else {
      return false;
    }
  }
}
