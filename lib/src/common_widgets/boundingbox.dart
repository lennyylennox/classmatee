import 'package:flutter/material.dart';

class BoundingBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Define the position and size of the bounding box with curved edges
    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
          Offset(20, 20), Offset(size.width - 20, size.height - 20)),
      Radius.circular(10.0), // Adjust the radius to control the curvature
    );

    // Draw the bounding box
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BoundingBoxWidget extends StatelessWidget {
  final Widget child;

  BoundingBoxWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BoundingBoxPainter(),
      child: child,
    );
  }
}
