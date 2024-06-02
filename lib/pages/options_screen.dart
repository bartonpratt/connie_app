import 'package:connie_app/pages/video_page.dart';
import 'package:provider/provider.dart';

import '../app_provider.dart';
import '../exports.dart';
import 'homepage.dart';
import 'img_scan.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({super.key});

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
                icon: Icon(Icons.restore),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height:70,child: Image.asset('assets/images/bot.png')),
                      const Text('Awesome😂!'),
                      const Text('Select any to get started..'),
                      const SizedBox(height: 16,),
                      Container(
                          height: 270,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black), // Border color
                          borderRadius: BorderRadius.circular(12.0), // Border radius
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                          children: [
                            PrettyShadowButton(label: 'ConnieBot',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const GenerativeAISample()));
                            },
                            icon: Icons.reddit_rounded,
                            shadowColor: Colors.pink,


                            ),
                            const SizedBox(height: 20), // Add some space between buttons
                            PrettyWaveButton(
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
                            SizedBox(height: 16,),
                            PrettyShadowButton(label: 'find out',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        VideoPage()));
                              },
                              icon: Icons.emoji_emotions,
                              shadowColor: Colors.pink,


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
      }
    );
  }
}
