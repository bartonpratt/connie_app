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
              top: 100.0, // Adjust the top value to move the Lottie animation down
              left: 0,
              right: 0,
              child: Center(
                child: Lottie.asset('assets/lottie files/cake_card.json'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Center(
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
                      onTap: (){
                        Get.to(()=>ExpandableLetterWidget());
                      },
                      onFinished: () {
                        Get.to(() => ExpandableLetterWidget());
                      },totalRepeatCount: 1,
                    ),
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