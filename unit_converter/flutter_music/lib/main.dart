import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.orange,
      ),
      home: P5textApp(),
    );
  }
}

class P5textApp extends StatefulWidget {
  @override
  _P5textAppState createState() => _P5textAppState();


}
class _P5textAppState extends State<P5textApp> {
  int textboxsize =s
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.black,
            canvasColor: Colors.red
        ),
        home: Scaffold(
            body: GestureDetector(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  RiveAnimation.asset(
                    "assets/p5textbox.riv",
                  ),
                  Text(
                    "ペルソナ５の\n動くテキストボックスが\n好きだったので作成した。",
                    style:TextStyle(
                        color: Colors.white,
                        fontSize: 20

                    ),
                  ),
                ],
              ),
            )
        )
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


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 100;
  int _w = 100;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter *= 2;
    });
  }
  void _reset(){
    setState(() {
      _counter = 100;
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _incrementCounter,
                child: AnimatedContainer(
                  duration:Duration(milliseconds: 100),
                  width: _counter.toDouble(),
                  height: 200,
                  child:Center(
                    child:Text(_counter.toString()),
                  )
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: _reset,
                    icon: Icon(Icons.restart_alt)
                ),
                IconButton(
                    onPressed: _incrementCounter,
                    icon: Icon(Icons.add)
                )
              ],
            )

          ]
        ),
      ),
    );
  }
}
