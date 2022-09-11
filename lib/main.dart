import 'package:flutter/material.dart';
import 'thegame.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: ' '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context ){
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('images/waves.jpg'),
        fit: BoxFit.fill,)
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    primary: const Color(0xffad974f),
                    minimumSize: const Size(200, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                    )
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TheGame(title: '',)));
                },
                  child: const Text('PLAY',
                  style: TextStyle(
                    fontFamily: 'CinzelDecorative',
                    color: Color(0xffffffff),
                    fontSize: 48.0,
                    fontWeight: FontWeight.w500,
                    shadows: [Shadow(
                      offset: Offset(4.5, 4.5),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0))]
                       )
                  )
                  ),
              ],
          ),
          ),
          ),
    );
}
}
