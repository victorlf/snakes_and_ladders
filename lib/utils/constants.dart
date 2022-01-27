import 'package:flutter/material.dart';

const Set<Set<int>> laddersPoints = {
  {2, 22},
  {6, 16},
  {9, 29},
  {13, 77},
  {36, 49},
  {51, 70},
  {53, 64},
  {62, 91},
  {75, 85},
  {86, 96},
  {69, 97}
};

const Set<Set<int>> snakesPoints = {
  {1, 20},
  {5, 25},
  {8, 17},
  {18, 37},
  {26, 47},
  {31, 81},
  {33, 40},
  {55, 74},
  {58, 89},
  {84, 95},
};

const usersInitialPoint = 90;

final keysList = List<GlobalKey>.generate(100, (_) => GlobalKey());

const user1Color = Colors.red;
const user2Color = Colors.green;
