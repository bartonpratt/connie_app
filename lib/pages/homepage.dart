import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';

import '../exports.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Returning false ensures that the back button press is ignored
          return false;
        },
        child: Scaffold(
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
                  top:
                      100.0, // Adjust the top value to move the Lottie animation down
                  left: 0,
                  right: 0, bottom: 0,
                  child: Lottie.asset('assets/lottie files/cake_card.json'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
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
                            TypewriterAnimatedText(
                                "To the Birthday Girl, Connie!'",
                                speed: const Duration(milliseconds: 50)),
                            TypewriterAnimatedText(
                                "You're in for a surprise😂😂"),
                            WavyAnimatedText("Happy Birthday"),
                            RotateAnimatedText("YOU"),
                            RotateAnimatedText("ARE"),
                            RotateAnimatedText("AWESOME!"),
                          ],
                          displayFullTextOnTap: true,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExpandableLetterWidget()));
                          },
                          onFinished: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExpandableLetterWidget()));
                          },
                          totalRepeatCount: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
