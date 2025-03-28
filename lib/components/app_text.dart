import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  AppText({super.key, required this.text, this.fontsize = 60});

  String text;
  double fontsize = 60.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: text,
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
                    ..strokeWidth = fontsize / 10
                    ..color = Colors.white,
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: text,
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
        ),
      ],
    );
  }
}
