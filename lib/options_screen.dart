import 'exports.dart';
import 'img_scan.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({super.key});

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:70,child: Image.asset('assets/images/bot.png')),
            const Text('Awesome😂!'),
            const Text('Select any feature to get started..'),
            const SizedBox(height: 16,),
            Container(height: 200,
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
                    Get.to(() => const GenerativeAISample());
                  },
                  icon: Icons.reddit_rounded,
                  shadowColor: Colors.pink,


                  ),
                  const SizedBox(height: 20), // Add some space between buttons
                  PrettyWaveButton(
                    backgroundColor: Colors.blue,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/logo/logo.png', height: 24.0), // Adjust the path and size as needed
                        const SizedBox(width: 10),
                        const Text(
                          'Img To Text Scanner',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Get.to(() => const TextRecognizerPage());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
