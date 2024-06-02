import 'dart:math';
import 'package:connie_app/img_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RippleAnim extends StatefulWidget {
  @override
  _RippleAnimState createState() => _RippleAnimState();
}

class _RippleAnimState extends State<RippleAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: MyCustomPainter(_animation.value),
              child: Container(
                width: 500, // Adjust the size of the animation container
                height: 500, // Adjust the size of the animation container
              ),
            ),
            Positioned(
              child: Image.asset(
                'assets/images/connie1_.png', // Replace with your local image path
                width: 500,
                height: 500,
              ),
            ),ElevatedButton(onPressed: (){
              Get.to(()=>TextRecognizerPage());
            }, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double animationValue;

  MyCustomPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (int value = 3; value >= 0; value--) {
      circle(canvas, Rect.fromLTRB(0, 0, size.width, size.height),
          value + animationValue);
    }
  }

  void circle(Canvas canvas, Rect rect, double value) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 220, 25, 38)
          .withOpacity((1 - (value / 4)).clamp(.0, 1));

    canvas.drawCircle(rect.center,
        sqrt((rect.width * .5 * rect.width * .5) * value / 4), paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return true;
  }
}
