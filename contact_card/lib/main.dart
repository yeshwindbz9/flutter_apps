import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Card',
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0x00000000),
          title: Text(
            'Contact Card',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'SF-Bold',
              color: Colors.black87,
            ),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 69,
                backgroundImage: AssetImage('images/yeshwin.jpg'),
              ),
              Text(
                'Yeshwin',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 32,
                  fontFamily: 'Langar',
                ),
              ),
              Opacity(
                opacity: 0.69,
                child: Text(
                  'Computer Engineer',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 23,
                    fontFamily: 'Audiowide',
                    letterSpacing: 5,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 345,
                child: Divider(
                  height: 29,
                  color: Colors.black87,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                color: Colors.yellow,
                elevation: 29,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.black,
                  ),
                  title: Text(
                    '+91 9167542675',
                    style: TextStyle(
                      fontFamily: 'SF-Bold',
                    ),
                  ),
                  onTap: (){
                    launch(('tel:+91 9167542675'));
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                color: Colors.yellow,
                elevation: 29,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.mail_outline_rounded,
                    color: Colors.black,
                  ),
                  title: Text(
                    'yeshwindbz9@gmail.com',
                    style: TextStyle(
                      fontFamily: 'SF-Bold',
                    ),
                  ),
                  onTap: (){
                    launch(('mailto:yeshwindbz9@gmail.com'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
