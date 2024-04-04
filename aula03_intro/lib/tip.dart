class Tip {
  final double _defaultTip = 10.0;
  double? _customTip = 0.0;
  double? _totalAmount = 0.0;
  int? _friendAmount = 2;

  Tip() {
    _customTip = 10;
  }
  Tip.withData({double customTip = 10, double totalAmount = 30}) {
    _customTip = customTip;
    _totalAmount = totalAmount;
  }
  //2.1
  double get tipPerPersonDefault {
    return _defaultTip / _friendAmount!;
  }

  //2.2
  double get tipPerPersonCustom {
    return (_customTip ?? 0) / _friendAmount!;
  }

  //2.3
  double get tipPerPersonTotalTipDefault {
    return ((_totalAmount ?? 0) + _defaultTip) / _friendAmount!;
  }

  //2.4
  double get tipPerPersonTotalTipCustom {
    return (((_totalAmount ?? 0) + (_customTip ?? 0))) / _friendAmount!;
  }

  String get customTip {
    return (_customTip ?? 0).toStringAsFixed(2);
  }

  String get defaultTip {
    return _defaultTip.toStringAsFixed(2);
  }

  String get amount {
    return (_totalAmount ?? 0).toStringAsFixed(2);
  }

  String get defaultTippedAmount {
    return ((_totalAmount ?? 0) * _defaultTip).toStringAsFixed(2);
  }

  String get amountPlusDefaultTippedAmount {
    return ((_totalAmount ?? 0) * (1 + (_defaultTip / 100))).toStringAsFixed(2);
  }

  String get customTippedAmount {
    return ((_totalAmount ?? 0) * _customTip!).toStringAsFixed(2);
  }

  String get amountPlusCustomTippedAmount {
    return ((_totalAmount ?? 0) * (1 + (_customTip! / 100))).toStringAsFixed(2);
  }

  set amount(String value) {
    try {
      _totalAmount = double.parse(value);
    } catch (e) {
      _totalAmount = 0;
    }
  }

  set customTip(String value) {
    try {
      _customTip = double.parse(value);
    } catch (e) {
      _customTip = 0;
    }
  }
}
