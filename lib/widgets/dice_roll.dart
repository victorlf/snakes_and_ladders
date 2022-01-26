import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/providers/dice_provider.dart';
//import 'package:snakes_and_ladder/models/game_model.dart';

class DiceRoll extends StatefulWidget {
  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  @override
  Widget build(BuildContext context) {
    List<String> _diceOneImages = [
      "assets/images/dice1.png",
      "assets/images/dice2.png",
      "assets/images/dice3.png",
      "assets/images/dice4.png",
      "assets/images/dice5.png",
      "assets/images/dice6.png",
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Consumer<DiceProvider>(builder: (context, dice, child) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.25,
                        // height: MediaQuery.of(context).size.height * 0.15,
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    _diceOneImages[dice.dice1ImageIndex]),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.25,
                        // height: MediaQuery.of(context).size.height * 0.15,
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    _diceOneImages[dice.dice2ImageIndex]),
                                fit: BoxFit.contain)),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
