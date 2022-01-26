import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/providers/dice_provider.dart';
import 'package:snakes_and_ladders/providers/user_provider.dart';
import 'package:snakes_and_ladders/utils/constants.dart';
import 'package:snakes_and_ladders/widgets/dice_roll.dart';
import 'package:snakes_and_ladders/widgets/shape_painter.dart';

import 'package:snakes_and_ladders/widgets/square.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late final List<GlobalKey> keysList;
  late final GlobalKey keyContainer;
  List<Map<Offset, Offset>> ladderList = [];
  List<Offset> usersOffsetList = [];
  // base da escada é o value do Map

  List<int> usersList = [99, 99];
  bool gameIsOn = false;

  @override
  void initState() {
    super.initState();
//    keysList = List<GlobalKey>.generate(100, (_) => GlobalKey());
    keyContainer = GlobalKey();
    WidgetsBinding.instance?.addPostFrameCallback((_) {});
  }

  void updateUserOffsets({required int addUser1, required int addUser2}) {
    usersList.first += addUser1;
    usersList.last += addUser2;

    for (var user in usersList) {
      final RenderBox renderUser =
          keysList[user].currentContext?.findRenderObject() as RenderBox;
      Offset offsetUser = renderUser.localToGlobal(Offset.zero);
      usersOffsetList.add(offsetUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    void startGame() {
      setState(() {
        for (var points in laddersPoints) {
          final RenderBox renderStart = keysList[points.first]
              .currentContext
              ?.findRenderObject() as RenderBox;
          Offset offsetStart = renderStart.localToGlobal(Offset.zero);

          final RenderBox renderEnd = keysList[points.last]
              .currentContext
              ?.findRenderObject() as RenderBox;
          Offset offsetEnd = renderEnd.localToGlobal(Offset.zero);
          ladderList.add({offsetStart: offsetEnd});
        }
        gameIsOn = true;
      });
      Provider.of<UserProvider>(context, listen: false).setInitialPositions();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<UserProvider>(builder: (context, users, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomPaint(
                  foregroundPainter: ShapePainter(
                    pairList: ladderList,
                    //userList: usersOffsetList,
                    userList: users.getUsersPosition,
                  ),
                  child: Container(
                    key: keyContainer,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4.0, color: Theme.of(context).primaryColor),
                    ),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 100,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Square(
                            key: keysList[index],
                            index: index,
                          );
                        }),
                  ),
                ),
              ),
              gameIsOn
                  ? rollDice(users)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        color: Theme.of(context).primaryColor,
                        child: IconButton(
                            onPressed: () => startGame(),
                            icon: const Icon(
                              Icons.play_circle_fill_rounded,
                              color: Colors.white,
                              size: 100.0,
                            )),
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }

  Widget rollDice(UserProvider users) {
    return Center(
      child: TextButton(
        onPressed: () async {
          await Provider.of<DiceProvider>(context, listen: false)
              .generateDiceValue();
          final dice1 =
              Provider.of<DiceProvider>(context, listen: false).dice1ValueCount;
          final dice2 =
              Provider.of<DiceProvider>(context, listen: false).dice2ValueCount;

          final addUser1 = dice1 + dice2;

          users.updatePositions(addUser1: addUser1, addUser2: 0);
          if (users.user1PositionIndex == 0) {
            _showMyDialog(users);
          }
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          color: Colors.red,
          child: Column(
            children: [
              DiceRoll(),
              Text('Jogar dados para Jogador Vermelho (1)'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(UserProvider users) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                setState(() {
                  ladderList = [];
                  gameIsOn = false;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
