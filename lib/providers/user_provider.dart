import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/utils/constants.dart';

class UserProvider with ChangeNotifier {
  int _user1Position = -1;
  int _user2Position = -1;
  int _lastOneToPlay = 0;

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
  int get user2PositionIndex => _user2Position;

  Offset get user1Position => _user1OffsetPosition;
  Offset get user2Position => _user2OffsetPosition;

  Color get getColorOflastUserToPlay {
    if (_lastOneToPlay == 1) {
      return user1Color;
    } else if (_lastOneToPlay == 2) {
      return user2Color;
    } else {
      return Colors.purple;
    }
  }

  List<Offset> get getUsersPosition {
    var list = <Offset>[];
    if (_user1OffsetPosition != Offset(0, 0)) {
      list.add(_user1OffsetPosition);
    }

    if (_user2OffsetPosition != Offset(0, 0)) {
      list.add(_user2OffsetPosition);
    }
    return list;
  }

  //void emptyUsersPosition() => _user1OffsetPosition == Offset(0, 0);

  void updatePositions({required int addUser1, required int addUser2}) {
    //_user1Position += addUser1;
    //_user2Position += addUser2;

    _lastOneToPlay = addUser1 != 0 ? 1 : 2;

    if (addUser1 > 0) {
      debugPrint('Position Before of user 1: $_user1Position');
      final userPointBefore = _user1Position;
      if (userPointBefore < 0) {
        _user1Position = usersInitialPoint;
      }

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

      if (userPointBefore < 0) {
        _user1Position += 1;
      }

      if (_user1Position < 0) {
        _user1Position = _user1Position.abs();
      }

      for (var pair in laddersPoints) {
        if (pair.last == _user1Position) {
          _user1Position = pair.first;
        }
      }

      for (var pair in snakesPoints) {
        if (pair.first == _user1Position) {
          _user1Position = pair.last;
        }
      }

      final RenderBox renderUser1 = keysList[_user1Position]
          .currentContext
          ?.findRenderObject() as RenderBox;
      _user1OffsetPosition = renderUser1.localToGlobal(Offset.zero);
    }
    // User 2
    if (addUser2 > 0) {
      debugPrint('Position Before of user 2: $_user2Position');
      final userPointBefore = _user2Position;
      if (userPointBefore < 0) {
        _user2Position = usersInitialPoint;
      }
      for (var i = 1; i <= addUser2; i++) {
        if (isRowToDecrease(_user2Position)) {
          if (isEndOfRow(endRowList2, _user2Position)) {
            _user2Position -= 11;
            _user2Position += 1;
          } else {
            _user2Position -= 1;
          }
        } else {
          if (isEndOfRow(endRowList1, _user2Position)) {
            _user2Position -= 9;
            _user2Position -= 1;
          } else {
            _user2Position += 1;
          }
        }
      }

      if (userPointBefore < 0) {
        _user2Position += 1;
      }

      if (_user2Position < 0) {
        _user2Position = _user2Position.abs();
      }

      for (var pair in laddersPoints) {
        if (pair.last == _user2Position) {
          _user2Position = pair.first;
        }
      }

      for (var pair in snakesPoints) {
        if (pair.first == _user2Position) {
          _user2Position = pair.last;
        }
      }

      final RenderBox renderUser2 = keysList[_user2Position]
          .currentContext
          ?.findRenderObject() as RenderBox;
      _user2OffsetPosition = renderUser2.localToGlobal(Offset.zero);
      //notifyListeners();
    }

    debugPrint('Position After of user 1: $_user1Position');
    // User 2

    debugPrint('Position After of user 2: $_user2Position');

    notifyListeners();
    // =========
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
