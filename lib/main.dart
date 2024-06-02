import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connie_app/homepage.dart';
import 'package:connie_app/expandable_letter.dart';

import 'quiz_page.dart';
import 'options_screen.dart';


Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ValidationController

    return GetMaterialApp(
      title: 'Happy Birthday Connie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage', // Set the initial route to homepage
      getPages: [
        GetPage(
          name: '/homepage',
          page: () => MyHomePage(), // Define the route for MyHomePage
        ),
        GetPage(
          name: '/expandable_letter',
          page: () => const ExpandableLetterWidget(), // Define the route for ExpandableLetterWidget
        ),
        GetPage(
          name: '/date_picker_form',
          page: () => DatePickerForm(), // Define the route for DatePickerForm
        ),
        GetPage(
          name: '/options_page',
          page: () => OptionsPage(), // Define the route for OptionsPage
        ),
      ],
    );
  }
}
