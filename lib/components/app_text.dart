import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText({super.key, required this.text, this.fontsize = 60});

  String text;
  double fontsize = 60.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontsize,
            fontWeight: FontWeight.w900,
            fontFamily: 'Iskoola Pota',
            letterSpacing: 2,
            wordSpacing: 2,
            height: 0.9,
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 8.0 
                  ..color = Colors.white,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontsize,
            fontWeight: FontWeight.w900,
            fontFamily: 'Iskoola Pota',
            letterSpacing: 2,
            wordSpacing: 2, 
            height: 0.9,
            color: Color(0xFF371B64), 
          ),
        ),
      ],
    );
  }
}
