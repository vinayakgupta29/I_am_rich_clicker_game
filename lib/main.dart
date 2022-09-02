import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ' ',
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  var img = 'images/Purple_Gem_PNG_Clip_Art_Image.png';
  SharedPreferences? preferences;

  void initStorage() async {
    preferences = await SharedPreferences.getInstance(); //init first time 0
    int? savedData = preferences?.getInt("_counter");
    if (savedData == null) {
      await preferences!.setInt("_counter", _counter);
    } else {
      _counter = savedData;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initStorage();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween<double>(begin: 325, end: 350), weight: 50),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 350, end: 325), weight: 50)
    ]
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {  });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

  }

  void _incrementcounter() async {
    preferences?.setInt("_counter", _counter++);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "I am Rich",
          style: TextStyle(
              fontFamily: 'CinzelDecorative',
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.w500),
        )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff3498db), Color(0xff2c3e50)],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff800080),
              Color(0xffffc0cb),
            ],
          )),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'I am RICH',
                  style: TextStyle(
                      fontFamily: 'CinzelDecorative',
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$ $_counter',
                  style: const TextStyle(
                      fontFamily: 'CinzelDecorative',
                      color: Color(0xffffd700),
                      fontSize: 48.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 400,
                  child: Ink(
                    decoration: const ShapeDecoration(shape: CircleBorder()),
                    child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, _) {
                          return IconButton(
                            onPressed: () {
                              SystemSoundType.click;
                              _controller.forward();
                              _controller.reset();
                              _incrementcounter();
                            },
                            icon: Image.asset(img),
                            iconSize: _sizeAnimation.value,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
