
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ Color(0xff800080), Color(0xffffc0cb),],
            )
          ),
          child: const Center(
            child: Image(
            image: AssetImage('images/purple_gem_back.png'),
        ),
      ),
    ),
  )
  )
)
);
}



      
      
      
      
