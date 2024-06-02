
import 'package:animated_text_kit/animated_text_kit.dart';
import 'exports.dart';


class ExpandableLetterWidget extends StatefulWidget {
  const ExpandableLetterWidget({Key? key}) : super(key: key);

  @override
  _ExpandableLetterWidgetState createState() => _ExpandableLetterWidgetState();
}

class _ExpandableLetterWidgetState extends State<ExpandableLetterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: AnimCard(
                      Color(0xffFF6594),
                      '',
                      '',
                      '',
                    ),
                  ),


                ],
              ),
            ),
          ),
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText("don't!"),
                  FadeAnimatedText("don't LOOK!!"),
                  FadeAnimatedText("don't LOOK DOWN HERE!!!"),
                ],
                repeatForever: true,
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.to(() => DatePickerForm());
            },
            child: const Text("Curious Huh?? Click Me😂"),
          ),
          const SizedBox(height: 20), // Add some space below the button
        ],
      ),
    );
  }
}

class AnimCard extends StatefulWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;

  const AnimCard(this.color, this.num, this.numEng, this.content, {super.key});

  @override
  _AnimCardState createState() => _AnimCardState();
}

class _AnimCardState extends State<AnimCard> {
  var padding = 150.0;
  var bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPadding(
            padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: Container(
              child: CardItem(
                widget.color,
                widget.num,
                widget.numEng,
                widget.content,
                () {
                  setState(() {
                    padding = padding == 0 ? 150.0 : 0.0;
                    bottomPadding = bottomPadding == 0 ? 150 : 0.0;
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 200),
                height: 180,
                width: MediaQuery.of(context).size.width > 850
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 30)
                  ],
                  color: Colors.grey.shade200.withOpacity(1.0),
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30)),
                ),
                child: Center(
                    child: Icon(Icons.favorite,
                        color: const Color(0xffFF6594).withOpacity(1.0),
                        size: 70)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;
  final onTap;

  const CardItem(this.color, this.num, this.numEng, this.content, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cardWidth = width > 850 ? width / 2 : width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 220,
        width: cardWidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xffFF6594).withOpacity(0.2),
                blurRadius: 25),
          ],
          color: color.withOpacity(1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'To You ❤️',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You're really special, and I'm so appreciative of our friendship. Wishing you an amazing day full of happiness, love, and all of your favorite things. Here's a toast to an amazing year ahead!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "-Joey",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
