import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/picture.jpg'),
              ),
              Text(
                'Victor Saad',
                style: TextStyle(
                  fontFamily: 'Prototype',
                  fontSize: 35,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('FLUTTER DEV',
                  style: TextStyle(
                    fontFamily: 'Righteous',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    letterSpacing: 1.3,
                  )),
              SizedBox(
                height: 20,
                width: 300,
                child: Divider(
                  color: Colors.amber,
                ),
              ),
              Card(
                color: Colors.grey[500],
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    ' + 55 9 9888 9888 ',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Prototype',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.grey[500],
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    ' victorsaad00@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Prototype',
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 300,
                child: Divider(
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: 20,
                      color: Colors.black,
                    ),
                    Text(
                      ' + 55 9 9888 9888 ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Prototype',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ), */
