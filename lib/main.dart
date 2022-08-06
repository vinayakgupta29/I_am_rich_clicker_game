import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("I am Rich", style: TextStyle(fontFamily: 'CinzelDecorative'),)
        ),
        backgroundColor: Colors.purpleAccent[400],
      ),
      
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            )
          ),
          child: Center(
            child: Image(
            image: AssetImage('images/purple_gem_back.png'),
        ),
      ),
    ),
  )
  )
));
}



      
      
      
      
