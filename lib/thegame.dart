import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;

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
      home: TheGame(title: 'A'),
    );
  }
}

class TheGame extends StatefulWidget {
  const TheGame({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TheGame> createState() => _TheGameState();
}

class _TheGameState extends State<TheGame> with SingleTickerProviderStateMixin {
  final formatter = intl.NumberFormat.decimalPattern();
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
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 325, end: 350), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 350, end: 325), weight: 50)
    ]
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
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
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffbc15ce),
              Color(0xff805ba5),
            ],
          )),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '\u269c I am RICH \u269c',
                  style: TextStyle(
                    fontFamily: 'CinzelDecorative',
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                          offset: Offset(3.5, 3.5),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '\u22b0 \u2123 ',
                        style: TextStyle(
                            color: Color(0xffe5e4e2),
                            shadows: [
                              Shadow(
                                  offset: Offset(3.5, 3.5),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0))
                            ],
                            fontSize: 48.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        formatter.format(_counter),
                        style: const TextStyle(
                            fontFamily: 'CinzelDecorative',
                            color: Color(0xffffd700),
                            shadows: [
                              Shadow(
                                  offset: Offset(3.5, 3.5),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0))
                            ],
                            fontSize: 48.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        ' \u22b1',
                        style: TextStyle(
                            color: Color(0xffe5e4e2),
                            shadows: [
                              Shadow(
                                  offset: Offset(3.5, 3.5),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0))
                            ],
                            fontSize: 48.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ]),
                const SizedBox(
                  height: 65,
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
                              HapticFeedback.mediumImpact();
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
