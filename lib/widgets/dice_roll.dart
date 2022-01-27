import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/providers/dice_provider.dart';
import 'package:snakes_and_ladders/providers/user_provider.dart';
import 'package:snakes_and_ladders/utils/constants.dart';
//import 'package:snakes_and_ladder/models/game_model.dart';

class DiceRoll extends StatefulWidget {
  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int userTurn = 1;
  Color userTurnColor = user1Color;
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

    return Consumer<DiceProvider>(
      builder: (context, dice, child) {
        Color color =
            Provider.of<UserProvider>(context).getColorOflastUserToPlay;
        if (dice.dice1ValueCount != dice.dice2ValueCount) {
          userTurn = color == user1Color ? 2 : 1;
          userTurnColor = color == user1Color ? user2Color : user1Color;
        }

        return Column(
          children: [
            Container(
              color: color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '= ${dice.dice1ValueCount + dice.dice2ValueCount}',
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'É a vez do Jogador $userTurn',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: userTurnColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
