import 'package:flutter/material.dart';
import 'package:connie_app/homepage.dart';
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
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),

    );
  }
}
