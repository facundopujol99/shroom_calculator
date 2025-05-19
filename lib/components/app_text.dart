import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  AppText({super.key, required this.text, this.fontsize = 60, this.isUnderlined = false});

  String text;
  double fontsize = 60.0;
  bool isUnderlined;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size;
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
              decoration: isUnderlined
                  ? TextDecoration.underline
                  : TextDecoration.none,
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
