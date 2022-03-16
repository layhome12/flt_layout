import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_basic/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Flutter',
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
        primarySwatch: Colors.blue,
      ),
      home: const DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('assets/images/submarine.jpg'),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: const Text(
              "Surabaya Submarine Monument",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, fontFamily: "Lobster"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Icon(Icons.calendar_today_outlined),
                    Text(
                      "Buka Setiap Hari",
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Icon(Icons.access_time_outlined),
                    Text(
                      "08:00-16:00",
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Icon(Icons.attach_money),
                    Text(
                      "Rp. 10.000",
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontFamily: "Oxygen"),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset('assets/images/submarine.jpg'),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset('assets/images/submarine.jpg'),
                    )),
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset('assets/images/submarine.jpg'),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
