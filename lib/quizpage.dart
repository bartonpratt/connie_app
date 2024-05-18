// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:connie_app/ripple_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuizAuth extends StatefulWidget {
  const QuizAuth({super.key});

  @override
  _QuizAuthState createState() => _QuizAuthState();
}

class _QuizAuthState extends State<QuizAuth>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final TextEditingController _yearController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: .7, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _validateInput() {
    if (_yearController.text == '2019') {
      Fluttertoast.showToast(
        msg: 'Perfect!',
      );
      _yearController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RippleAnim()),
      );
    } else if (_yearController.text == ''){
      Fluttertoast.showToast(
        msg: 'Year cannot be empty',
      );
    } else{
      Fluttertoast.showToast(
        msg: 'Incorrect! Please try again..',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(textAlign: TextAlign.center,
                          'Which Year Did We Become Friends?',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.red.shade300,
                          ),
                        ),
                      ),
                      SizedBox(),
                      component1(Icons.calendar_month, 'Year...', false, false,
                          _yearController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: width / 10),
                          RichText(
                            text: TextSpan(
                              text: 'Hint?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  HapticFeedback.lightImpact();
                                  Fluttertoast.showToast(
                                    webBgColor:
                                        "linear-gradient(to right, #fffff, #96c93d)",
                                    msg: 'haha! Come on.. no hint for ya',
                                  );
                                },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: width * .07),
                          height: width * .7,
                          width: width * .7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Color(0xff09090A),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Transform.scale(
                          scale: _animation.value,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              HapticFeedback.lightImpact();
                              _validateInput();
                            },
                            child: Container(
                              height: width * .2,
                              width: width * .2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color:  Colors.red.shade500,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                'UNLOCK',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component1(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController controller) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 8,
      width: width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: width / 30),
      decoration: BoxDecoration(
        color: Color(0xff212428),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white.withOpacity(.9)),
        obscureText: isPassword,
        keyboardType:
            isEmail ? TextInputType.emailAddress : TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  // @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
