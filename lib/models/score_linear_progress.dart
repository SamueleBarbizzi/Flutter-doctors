import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class ScoreLinearProgress extends CustomPainter {
  const ScoreLinearProgress(
      {required this.backColor,
      required this.frontColor,
      required this.strokeWidth,
      required this.value});
  final Color backColor, frontColor;
  final double strokeWidth, value;

  
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final paint1 = Paint()
      ..strokeWidth = strokeWidth
      ..color = backColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    final paint2 = Paint()
      ..strokeWidth = strokeWidth
      ..color = frontColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    canvas.drawLine(
      Offset(w * 0, h * 0.5), //starting point
      Offset(w * 1, h * 0.5), //end point

      paint1, //paint
    );

        canvas.drawLine(
      Offset(w * 0, h * 0.5), //starting point
      Offset(w * value, h * 0.5), //end point
      paint2, //paint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}