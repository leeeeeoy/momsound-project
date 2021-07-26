import 'dart:math';

import 'package:flutter/material.dart';

class BubblePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bubbleSize = Size(size.width, size.height * 0.8);
    final tailSize = Size(size.width * 0.1, size.height - bubbleSize.height);
    final fillet = bubbleSize.width * 0.1;
    final tailStartPoint = Point(size.width * 0.7, bubbleSize.height);

    final bubblePath = Path()
      ..moveTo(0, fillet)
      ..lineTo(0, bubbleSize.height - fillet)
      ..quadraticBezierTo(0, bubbleSize.height, fillet, bubbleSize.height)
      ..lineTo(
          bubbleSize.width - fillet - tailStartPoint.x + 150, bubbleSize.height)
      ..cubicTo(
        tailStartPoint.x + (tailSize.width * 0.2),
        tailStartPoint.y,
        tailStartPoint.x + (tailSize.width * 0.6),
        tailStartPoint.y + (tailSize.height * 0.2),
        tailStartPoint.x + tailSize.width / 2, // 목적지 x
        tailStartPoint.y + tailSize.height, // 목적지 y
      )
      ..cubicTo(
        (tailStartPoint.x + tailSize.width / 2) + (tailSize.width * 0.2),
        tailStartPoint.y + tailSize.height,
        tailStartPoint.x + tailSize.width,
        tailStartPoint.y + (tailSize.height * 0.3),
        tailStartPoint.x + tailSize.width, // 목적지 x
        tailStartPoint.y, // 목적지 y
      )
      ..lineTo(bubbleSize.width - fillet, bubbleSize.height)
      ..quadraticBezierTo(bubbleSize.width, bubbleSize.height, bubbleSize.width,
          bubbleSize.height - fillet)
      ..lineTo(bubbleSize.width, fillet)
      ..quadraticBezierTo(bubbleSize.width, 0, bubbleSize.width - fillet, 0)
      ..lineTo(fillet, 0)
      ..quadraticBezierTo(0, 0, 0, fillet);

    final tailPath = Path()
      ..moveTo(tailStartPoint.x, tailStartPoint.y)
      ..cubicTo(
        tailStartPoint.x + (tailSize.width * 0.2),
        tailStartPoint.y,
        tailStartPoint.x + (tailSize.width * 0.6),
        tailStartPoint.y + (tailSize.height * 0.2),
        tailStartPoint.x + tailSize.width / 2, // 목적지 x
        tailStartPoint.y + tailSize.height, // 목적지 y
      )
      ..cubicTo(
        (tailStartPoint.x + tailSize.width / 2) + (tailSize.width * 0.2),
        tailStartPoint.y + tailSize.height,
        tailStartPoint.x + tailSize.width,
        tailStartPoint.y + (tailSize.height * 0.3),
        tailStartPoint.x + tailSize.width, // 목적지 x
        tailStartPoint.y, // 목적지 y
      );

    // bubblePath.addPath(tailPath, Offset(0, 0));

    final paint = Paint()
      // ..color = Color(0xFFFFA9A9)  //  분홍색
      ..color = Color(0xFF7C7C7C) //  회색
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    // ..style = PaintingStyle.fill;
    canvas.drawPath(bubblePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
