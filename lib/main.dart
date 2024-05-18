import 'package:connie_app/expandable_letter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Happy Birthday Connie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route to '/'
      getPages: [
        GetPage(
          name: '/',
          page: () => MyHomePage(), // Define the route for MyHomePage
        ),
        GetPage(
          name: '/expandable_letter',
          page: () => const ExpandableLetterWidget(), // Define the route for ExpandableLetterWidget
        ),
      ],
    );
  }
}
