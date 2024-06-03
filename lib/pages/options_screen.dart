import '../exports.dart';
import 'homepage.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key});

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        if (provider.selectedMonth == null || provider.selectedYear == null) {
          return MyHomePage(); // Change to your desired widget or screen
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Provider.of<AppProvider>(context, listen: false).reset();
                },
                icon: const Icon(Icons.restore),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 70, child: Image.asset('assets/images/bot.png')),
                      const Text('Awesome😂!'),
                      const Text('Select any to get started..'),
                      const SizedBox(height: 16,),
                      Container(
                        height: 270,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PrettyShadowButton(duration: Durations.extralong4,elevation: 3,
                              label: 'ConnieBot',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const GenerativeAISample(),
                                  ),
                                );
                              },
                              icon: Icons.reddit_rounded,
                              shadowColor: Colors.pink,
                            ),
                            const SizedBox(height: 20), // Add some space between buttons
                            if (!kIsWeb) // Conditionally show the button if not running on web
                              PrettyWaveButton(duration: Durations.extralong4,waveLength: 4,
                                backgroundColor: Colors.blue,
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.image),
                                    SizedBox(width: 10),
                                    Text(
                                      'Img To Text Scanner',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const TextRecognizerPage()));
                                },
                              ),
                            const SizedBox(height: 16,),
                            PrettyNeumorphicButton(duration: Durations.extralong4,
                              label: 'find out',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const VideoPage(),
                                  ),
                                );
                              },
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
