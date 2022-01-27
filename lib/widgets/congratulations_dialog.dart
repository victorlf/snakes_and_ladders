import 'package:flutter/material.dart';

class CongratulationsDialog extends StatelessWidget {
  final Function finish;
  final Color userColor;
  const CongratulationsDialog(
      {required this.userColor, required this.finish, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: userColor, width: 10.0),
      ),
      child: AlertDialog(
        //backgroundColor: userColor,
        title: Text(
          'Parabéns Jogador ${userColor == Colors.red ? 1 : 2}',
          style: TextStyle(color: userColor),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Você ganhou essa rodada.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Jogar Novamente', style: TextStyle(color: userColor)),
            onPressed: () {
              finish();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
