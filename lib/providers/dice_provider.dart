import 'dart:math';

import 'package:flutter/material.dart';

class DiceProvider with ChangeNotifier {
  int _dice1Value;
  int _dice2Value;

  DiceProvider(this._dice1Value, this._dice2Value);

  int get dice1ValueCount => _dice1Value;
  int get dice2ValueCount => _dice2Value;

  int get dice1ImageIndex => _dice1Value > 0 ? _dice1Value - 1 : _dice1Value;
  int get dice2ImageIndex => _dice2Value > 0 ? _dice2Value - 1 : _dice2Value;

  Future<void> generateDiceValue() async {
    for (int i = 0; i < 6; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      //dice.generateDiceValue();
      _dice1Value = i;
      _dice2Value = i < 5 ? i + 1 : 0;
      debugPrint("Changing dice 1: $_dice1Value");
      debugPrint("Changing dice 2: $_dice2Value");
      notifyListeners();
    }
    _dice1Value = Random().nextInt(5) + 1;
    _dice2Value = Random().nextInt(5) + 1;
    debugPrint("dice1Value: $_dice1Value");
    debugPrint("dice2Value: $_dice2Value");
    notifyListeners();
  }
}
