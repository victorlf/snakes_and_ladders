import 'package:flutter/material.dart';
import 'dart:math';

class Square extends StatelessWidget {
  final int index;
  Square({required this.index, Key? key}) : super(key: key);

  final listOfColors = <Color>[
    Colors.blue.shade300,
    Colors.red.shade300,
    Colors.yellow.shade300,
    Colors.green.shade300,
    Colors.purple.shade300,
    Colors.orange.shade300,
    Colors.pink.shade300,
  ];

  late int newIndex;

  @override
  Widget build(BuildContext context) {
    final list = <int>[90, 70, 50, 30, 10];
    newIndex = index;
    for (var n in list) {
      checkInversition(n);
    }
    final finalIndex = 100 - newIndex;
    return Container(
      decoration: BoxDecoration(
        //color: listOfColors[Random().nextInt(listOfColors.length)],
        color: (10 <= index && index <= 19) ||
                (30 <= index && index <= 39) ||
                (50 <= index && index <= 59) ||
                (70 <= index && index <= 79) ||
                (90 <= index && index <= 99)
            ? index.isOdd
                ? Colors.yellow.shade300
                : Colors.blue.shade300
            : index.isEven
                ? Colors.yellow.shade300
                : Colors.blue.shade300,
        border: Border.all(width: 0.5),
      ),
      child: Center(
        child: Text('$finalIndex'),
      ),
    );
  }

  checkInversition(int number) {
    if ((index > number && index < number + 10) || index == number) {
      switch (index - number) {
        case 0:
          newIndex = number + 9;
          break;
        case 1:
          newIndex = number + 8;
          break;
        case 2:
          newIndex = number + 7;
          break;
        case 3:
          newIndex = number + 6;
          break;
        case 4:
          newIndex = number + 5;
          break;
        case 5:
          newIndex = number + 4;
          break;
        case 6:
          newIndex = number + 3;
          break;
        case 7:
          newIndex = number + 2;
          break;
        case 8:
          newIndex = number + 1;
          break;
        case 9:
          newIndex = number;
          break;
        default:
      }
    }
  }
}
