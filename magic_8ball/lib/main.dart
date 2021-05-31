import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  MyApp()
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0x00000000),
          elevation: 0,
          title: Text(
            'ASK A QUESTION',
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'SF-Bold',
              fontSize: 29,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.gif"),
                  fit: BoxFit.cover
              )
          ),
          child: Magic8Ball(),
        ),
      ),
    );
  }
}


class Magic8Ball extends StatefulWidget {
  @override
  _Magic8Ball createState() => _Magic8Ball();
}

class _Magic8Ball extends State<Magic8Ball> {
  int magicNum = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 69,
          ),
          Expanded(
              child: FlatButton(
                child: Image.asset('images/ball${magicNum}.png'),
                onPressed: (){
                  setState(() {
                    magicNum = Random().nextInt(5) + 1;
                  });
                },
              ),
          ),
        ],
      ),
    );
  }
}
