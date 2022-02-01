
import 'package:flutter/material.dart';
import 'package:flash_card/pages/addWordPage.dart';
import 'package:flash_card/pages/flashCardPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Card！！',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: FlashCardPage(title: 'Flash Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class FlashCard extends StatefulWidget {
  final heads;
  final tails;
  FlashCard(this.heads, this.tails);
  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  bool isHeads = true;
  void flip() {
    setState(() {
      this.isHeads = !this.isHeads;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Card(
        child: InkWell(
          splashColor: Colors.red.withAlpha(30),
          onTap: flip,
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(50),
              child: FittedBox(
                child: Text(
                  this.isHeads ? widget.heads : widget.tails,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  NavigationButton({required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: OutlinedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(child: Text(this.text)),
          )),
    ));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();
  int currentPage = 0;
  List<FlashCard> cards = [
    FlashCard("あああああああああ", "亜亜亜亜亜亜亜亜亜亜"),
    FlashCard("いいいいいいいいい", "伊伊伊伊伊伊伊伊伊伊"),
    FlashCard("a", "A"),
  ];
  void showNextCard() {
    setState(() {
      pageController.nextPage(
          duration: Duration(milliseconds: 800), curve: Curves.ease);
      currentPage += 1;
    });
  }

  void showPreviousCard() {
    setState(() {
      pageController.previousPage(
          duration: Duration(milliseconds: 800), curve: Curves.ease);
      currentPage -= 1;
    });
  }

  bool existsNextCard() {
    return currentPage < cards.length - 1;
  }

  bool existsPreviousCard() {
    return currentPage > 0;
  }

  void updateCurrentPage(int? index) {
    setState(() {
      currentPage = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1 / 1,
              child: PageView(
                controller: pageController,
                onPageChanged: updateCurrentPage,
                children: cards,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationButton(
                  text: "back",
                  onPressed: !existsPreviousCard()
                      ? null
                      : () {
                          showPreviousCard();
                        },
                ),
                NavigationButton(
                  text: "next",
                  onPressed: !existsNextCard()
                      ? null
                      : () {
                          showNextCard();
                        },
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=> AddWordPage())
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
