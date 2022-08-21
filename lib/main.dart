import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



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

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  SharedPreferences? preferences;
  void initStorage() async{
    preferences =await SharedPreferences.getInstance(); //init first time 0
    int? savedData = preferences?.getInt("counter");
    if(savedData == null){
      await preferences!.setInt("counter", counter);
    }
    else{
      counter = savedData;
    }
    setState(() {});

  }
  @override
  void initState(){
    super.initState();
    initStorage();
  }

  void _incrementCounter() async {
    preferences?.setInt("counter", counter++ );
    setState(() {});
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("I am Rich", 
            style: TextStyle(
              fontFamily: 'CinzelDecorative', 
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.w500),
              )
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ Color(0xff3498db), Color(0xff2c3e50)],
            )
          ),
      ),
      ),
      
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ Color(0xff800080),  Color(0xffffc0cb),],
            )
          ),
          child:  Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const Text('I am RICH',
                style: TextStyle(
                fontFamily: 'CinzelDecorative', 
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.w500),
                ),
                Text('\$ $counter',
                style: const TextStyle(
                fontFamily: 'CinzelDecorative', 
                color: Color(0xffffd700),
                fontSize: 48.0,
                fontWeight: FontWeight.w500),
              ),
                Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder()),
                  child: IconButton(onPressed: _incrementCounter, 
                icon: Image.asset('images/Purple_Gem_PNG_Clip_Art_Image.png'),
                iconSize: 400,
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
