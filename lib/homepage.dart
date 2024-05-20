import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'expandable_letter.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade100, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Stack(
          children: [
            // Positioned images
            Positioned(
              child:  Lottie.network(
                  'https://lottie.host/dddcc030-136f-43cc-b9bb-a74cf8820d37/nms6Qo5k43.json'),
            ),

            Center(
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText("To the Birthday Girl, Connie!'",
                          speed: const Duration(milliseconds: 50)),
                      TypewriterAnimatedText("You're in for a surprise😂😂"),
                      WavyAnimatedText("Happy Birthday"),
                      RotateAnimatedText("YOU"),
                      RotateAnimatedText("ARE"),
                      RotateAnimatedText("AWESOME!"),
                    ],
                    displayFullTextOnTap: true,
                    onFinished: () {
                      Get.to(() => ExpandableLetterWidget());
                    },totalRepeatCount: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}