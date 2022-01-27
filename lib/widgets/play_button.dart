import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final String text;
  final Color color;

  const PlayButton({required this.text, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        border: Border.all(width: 2.0, color: Colors.white),
      ),
      height: 50.0,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
