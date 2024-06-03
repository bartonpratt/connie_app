import 'package:flutter/material.dart';
import 'package:connie_app/pages/homepage.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppProvider appProvider = await AppProvider.getInstance();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>appProvider)
          ],
          child: const MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ValidationController

    return MaterialApp(
      title: 'Happy Birthday Connie',
      theme: ThemeData(
          fontFamily: 'Roboto',
          fontFamilyFallback: const ['Noto Emoji'],
        colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color.fromARGB(255, 171, 222, 244),
    )),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),

    );
  }
}
