import 'package:flutter/material.dart';

/// Decorative vector line art, scaled to fit without stretching.
class TigerBackgroundPainter extends CustomPainter {
  const TigerBackgroundPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = (size.width < size.height ? size.width : size.height) / 320;
    canvas.save();
    canvas.translate((size.width - 320 * scale) / 2, (size.height - 320 * scale) / 2);
    canvas.scale(scale);
    final ink = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Mirror the silhouette, ears, eyes, cheek stripes and fangs.
    for (final mirrored in [false, true]) {
      canvas.save();
      if (mirrored) {
        canvas.translate(320, 0);
        canvas.scale(-1, 1);
      }
      canvas.drawPath(Path()
        ..moveTo(160, 48)
        ..quadraticBezierTo(125, 38, 98, 58)
        ..cubicTo(62, 15, 28, 46, 51, 91)
        ..lineTo(37, 125)..lineTo(48, 121)
        ..lineTo(29, 159)..lineTo(43, 154)
        ..lineTo(34, 191)..lineTo(52, 183)
        ..quadraticBezierTo(58, 233, 104, 257)
        ..quadraticBezierTo(123, 289, 160, 294), ink);
      canvas.drawPath(Path()
        ..moveTo(85, 65)..quadraticBezierTo(47, 39, 62, 82)
        ..moveTo(70, 105)..lineTo(128, 126)..lineTo(112, 105)
        ..moveTo(75, 126)..quadraticBezierTo(92, 151, 123, 137)
        ..lineTo(75, 126)
        ..moveTo(101, 137)..lineTo(102, 145)
        ..moveTo(55, 146)..lineTo(84, 166)..lineTo(53, 159)
        ..moveTo(53, 178)..lineTo(86, 189)..lineTo(62, 193)
        ..moveTo(68, 213)..lineTo(100, 215)..lineTo(81, 227)
        ..moveTo(130, 146)..quadraticBezierTo(118, 166, 123, 181)
        ..moveTo(160, 198)..cubicTo(132, 224, 97, 205, 109, 186)
        ..quadraticBezierTo(120, 172, 141, 184)
        ..moveTo(111, 212)..quadraticBezierTo(113, 251, 132, 265)
        ..quadraticBezierTo(143, 273, 160, 272)
        ..moveTo(119, 218)..lineTo(128, 242)..lineTo(134, 222)
        ..moveTo(106, 195)..lineTo(77, 199)
        ..moveTo(106, 204)..lineTo(83, 212), ink);
      canvas.restore();
    }
    canvas.drawPath(Path()
      ..moveTo(136, 61)..lineTo(160, 72)..lineTo(184, 61)
      ..moveTo(133, 80)..lineTo(160, 91)..lineTo(187, 80)
      ..moveTo(145, 102)..lineTo(160, 120)..lineTo(175, 102)
      ..moveTo(160, 52)..lineTo(160, 116)
      ..moveTo(141, 182)..quadraticBezierTo(160, 176, 179, 182)
      ..lineTo(160, 198)..close()
      ..moveTo(145, 255)..quadraticBezierTo(160, 247, 175, 255), ink);
    canvas.restore();
  }

  @override
  bool shouldRepaint(TigerBackgroundPainter oldDelegate) => oldDelegate.color != color;
}
