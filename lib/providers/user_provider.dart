import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/utils/constants.dart';

class UserProvider with ChangeNotifier {
  late int _user1Position;
  late int _user2Position;

  Offset _user1OffsetPosition = Offset(0, 0);
  Offset _user2OffsetPosition = Offset(0, 0);

  final endRowList1 = <int>[99, 79, 59, 39, 29, 19];
  final endRowList2 = <int>[80, 60, 40, 20];

  void setInitialPositions() {
    _user1Position = usersInitialPoint;
    _user2Position = usersInitialPoint;
    final RenderBox renderUser1 = keysList[usersInitialPoint]
        .currentContext
        ?.findRenderObject() as RenderBox;
    _user1OffsetPosition = renderUser1.localToGlobal(Offset.zero);

    final RenderBox renderUser2 = keysList[usersInitialPoint]
        .currentContext
        ?.findRenderObject() as RenderBox;
    _user2OffsetPosition = renderUser2.localToGlobal(Offset.zero);
    notifyListeners();
  }

  int get user1PositionIndex => _user1Position;
  int get user2PositionINdex => _user2Position;

  Offset get user1Position => _user1OffsetPosition;
  Offset get user2Position => _user2OffsetPosition;

  List<Offset> get getUsersPosition => _user1OffsetPosition == Offset(0, 0)
      ? []
      : [_user1OffsetPosition, _user2OffsetPosition];

  //void emptyUsersPosition() => _user1OffsetPosition == Offset(0, 0);

  void updatePositions({required int addUser1, required int addUser2}) {
    //_user1Position += addUser1;
    _user2Position += addUser2;

    print('Position Before: $_user1Position');
    for (var i = 1; i <= addUser1; i++) {
      if (isRowToDecrease(_user1Position)) {
        if (isEndOfRow(endRowList2, _user1Position)) {
          _user1Position -= 11;
          _user1Position += 1;
        } else {
          _user1Position -= 1;
        }
      } else {
        if (isEndOfRow(endRowList1, _user1Position)) {
          _user1Position -= 9;
          _user1Position -= 1;
        } else {
          _user1Position += 1;
        }
      }
    }

    if (_user1Position < 0) {
      _user1Position = _user1Position.abs();
    }
    print('Position After: $_user1Position');

    for (var pair in laddersPoints) {
      if (pair.last == _user1Position) {
        _user1Position = pair.first;
      }

      if (pair.last == _user2Position) {
        _user2Position = pair.first;
      }
    }

    final RenderBox renderUser1 = keysList[_user1Position]
        .currentContext
        ?.findRenderObject() as RenderBox;
    _user1OffsetPosition = renderUser1.localToGlobal(Offset.zero);

    final RenderBox renderUser2 = keysList[_user2Position]
        .currentContext
        ?.findRenderObject() as RenderBox;
    _user2OffsetPosition = renderUser2.localToGlobal(Offset.zero);
    notifyListeners();
  }

  bool isRowToDecrease(int userPosition) {
    final list = <int>[90, 70, 50, 30, 10];
    for (var number in list) {
      if ((userPosition > number && userPosition < number + 10) ||
          number == userPosition) {
        return false;
      }
    }
    return true;
  }

  bool isEndOfRow(List<int> list, int userPosition) {
    for (var number in list) {
      if (userPosition == number) {
        return true;
      }
    }
    return false;
  }
}
