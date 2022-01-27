import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  // final Offset offsetStart;
  // late final Offset offsetEnd;
  final List<Map<Offset, Offset>> ladderList;
  final List<Map<Offset, Offset>> snakeList;
  final List<Offset> userList;
  ShapePainter({
    // required this.offsetStart,
    // required this.offsetEnd,
    required this.ladderList,
    required this.userList,
    required this.snakeList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var ladderPaint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.square;

    var snakePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    var user1Paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.square;

    var user2Paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.square;

    for (var offsetPair in ladderList) {
      Offset startingPoint = Offset(offsetPair.keys.first.dx,
          offsetPair.keys.first.dy - (size.height * 0.2));
      Offset endingPoint = Offset(offsetPair.values.first.dx,
          offsetPair.values.first.dy - (size.height * 0.2));

      canvas.drawLine(startingPoint, endingPoint, ladderPaint);
    }

    for (var offsetPair in snakeList) {
      Offset startingPoint = Offset(offsetPair.keys.first.dx,
          offsetPair.keys.first.dy - (size.height * 0.2));
      Offset endingPoint = Offset(offsetPair.values.first.dx,
          offsetPair.values.first.dy - (size.height * 0.2));

      canvas.drawLine(startingPoint, endingPoint, snakePaint);
    }

    for (var i = 0; i < userList.length; i++) {
      Offset startingPoint = Offset(
          userList[i].dx + (i == 0 ? (size.width * 0.01) : (size.width * 0.04)),
          userList[i].dy -
              (i == 0 ? (size.height * 0.19) : (size.height * 0.22)));

      canvas.drawCircle(startingPoint, 10.0, i == 0 ? user1Paint : user2Paint);
    }

    // double lineLengthX = (offsetStart.dx - offsetEnd.dx).abs();
    // double lineLengthY = (offsetStart.dy - offsetEnd.dy).abs();

    // const int dashWidth = 4;
    // const int dashSpace = 8;

    // double startX = offsetStart.dx;
    // double startY = offsetStart.dy;
    // while ((startX - offsetStart.dx) < lineLengthX ||
    //     (startY - offsetStart.dy) < lineLengthY) {
    //   print(startX);
    //   Offset startingPoint =
    //       //Offset(startX, offsetStart.dy - (size.height * 0.2));
    //       Offset(startX, startY - (size.height * 0.2));
    //   Offset endingPoint =
    //       //Offset(startX + dashWidth, offsetEnd.dy - (size.height * 0.2));
    //       Offset(startX + dashWidth, startY + dashWidth - (size.height * 0.2));

    //   startX += dashWidth + dashSpace;
    //   startY += dashWidth + dashSpace;

    //   canvas.drawLine(startingPoint, endingPoint, paint);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
