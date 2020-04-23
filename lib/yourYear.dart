import 'package:flutter/material.dart';

class YourYear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: Column(
      children: <Widget>[
        Text(
          "J      F      M      A      M      J      J      A      S      O      N      D",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        CustomPaint(painter: DrawCircle())
      ],
    )));
  }
}

class DrawCircle extends CustomPainter{
  Paint _paint;

  DrawCircle(){
    _paint = Paint()
        ..color = Colors.black26
        ..strokeWidth = 1.0
        ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size){
    canvas.drawCircle(Offset(-165, 10), 8.0, _paint);
    canvas.drawCircle(Offset(-135, 10), 8.0, _paint);
    canvas.drawCircle(Offset(-105, 10), 8.0, _paint);
    canvas.drawCircle(Offset(-75, 10), 8.0, _paint);
    canvas.drawCircle(Offset(-45, 10), 8.0, _paint);
    canvas.drawCircle(Offset(-15, 10), 8.0, _paint);
    canvas.drawCircle(Offset(15, 10), 8.0, _paint);
    canvas.drawCircle(Offset(45, 10), 8.0, _paint);
    canvas.drawCircle(Offset(75, 10), 8.0, _paint);
    canvas.drawCircle(Offset(105, 10), 8.0, _paint);
    canvas.drawCircle(Offset(135, 10), 8.0, _paint);
    canvas.drawCircle(Offset(165, 10), 8.0, _paint);

    canvas.drawCircle(Offset(-165, 30), 8.0, _paint);
    canvas.drawCircle(Offset(-135, 30), 8.0, _paint);
    canvas.drawCircle(Offset(-105, 30), 8.0, _paint);
    canvas.drawCircle(Offset(-75, 30), 8.0, _paint);
    canvas.drawCircle(Offset(-45, 30), 8.0, _paint);
    canvas.drawCircle(Offset(-15, 30), 8.0, _paint);
    canvas.drawCircle(Offset(15, 30), 8.0, _paint);
    canvas.drawCircle(Offset(45, 30), 8.0, _paint);
    canvas.drawCircle(Offset(75, 30), 8.0, _paint);
    canvas.drawCircle(Offset(105, 30), 8.0, _paint);
    canvas.drawCircle(Offset(135, 30), 8.0, _paint);
    canvas.drawCircle(Offset(165, 30), 8.0, _paint);

    canvas.drawCircle(Offset(-165, 50), 8.0, _paint);
    canvas.drawCircle(Offset(-135, 50), 8.0, _paint);
    canvas.drawCircle(Offset(-105, 50), 8.0, _paint);
    canvas.drawCircle(Offset(-75, 50), 8.0, _paint);
    canvas.drawCircle(Offset(-45, 50), 8.0, _paint);
    canvas.drawCircle(Offset(-15, 50), 8.0, _paint);
    canvas.drawCircle(Offset(15, 50), 8.0, _paint);
    canvas.drawCircle(Offset(45, 50), 8.0, _paint);
    canvas.drawCircle(Offset(75, 50), 8.0, _paint);
    canvas.drawCircle(Offset(105, 50), 8.0, _paint);
    canvas.drawCircle(Offset(135, 50), 8.0, _paint);
    canvas.drawCircle(Offset(165, 50), 8.0, _paint);

    canvas.drawCircle(Offset(-165, 70), 8.0, _paint);
    canvas.drawCircle(Offset(-135, 70), 8.0, _paint);
    canvas.drawCircle(Offset(-105, 70), 8.0, _paint);
    canvas.drawCircle(Offset(-75, 70), 8.0, _paint);
    canvas.drawCircle(Offset(-45, 70), 8.0, _paint);
    canvas.drawCircle(Offset(-15, 70), 8.0, _paint);
    canvas.drawCircle(Offset(15, 70), 8.0, _paint);
    canvas.drawCircle(Offset(45, 70), 8.0, _paint);
    canvas.drawCircle(Offset(75, 70), 8.0, _paint);
    canvas.drawCircle(Offset(105, 70), 8.0, _paint);
    canvas.drawCircle(Offset(135, 70), 8.0, _paint);
    canvas.drawCircle(Offset(165, 70), 8.0, _paint);

    canvas.drawCircle(Offset(-165, 90), 8.0, _paint);
    canvas.drawCircle(Offset(-135, 90), 8.0, _paint);
    canvas.drawCircle(Offset(-105, 90), 8.0, _paint);
    canvas.drawCircle(Offset(-75, 90), 8.0, _paint);
    canvas.drawCircle(Offset(-45, 90), 8.0, _paint);
    canvas.drawCircle(Offset(-15, 90), 8.0, _paint);
    canvas.drawCircle(Offset(15, 90), 8.0, _paint);
    canvas.drawCircle(Offset(45, 90), 8.0, _paint);
    canvas.drawCircle(Offset(75, 90), 8.0, _paint);
    canvas.drawCircle(Offset(105, 90), 8.0, _paint);
    canvas.drawCircle(Offset(135, 90), 8.0, _paint);
    canvas.drawCircle(Offset(165, 90), 8.0, _paint);

    canvas.drawCircle(Offset(-165, 110), 8.0, _paint);
    canvas.drawCircle(Offset(-135, 110), 8.0, _paint);
    canvas.drawCircle(Offset(-105, 110), 8.0, _paint);
    canvas.drawCircle(Offset(-75, 110), 8.0, _paint);
    canvas.drawCircle(Offset(-45, 110), 8.0, _paint);
    canvas.drawCircle(Offset(-15, 110), 8.0, _paint);
    canvas.drawCircle(Offset(15, 110), 8.0, _paint);
    canvas.drawCircle(Offset(45, 110), 8.0, _paint);
    canvas.drawCircle(Offset(75, 110), 8.0, _paint);
    canvas.drawCircle(Offset(105, 110), 8.0, _paint);
    canvas.drawCircle(Offset(135, 110), 8.0, _paint);
    canvas.drawCircle(Offset(165, 110), 8.0, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
