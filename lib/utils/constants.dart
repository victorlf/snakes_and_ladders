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

const usersInitialPoint = 90;

final keysList = List<GlobalKey>.generate(100, (_) => GlobalKey());
